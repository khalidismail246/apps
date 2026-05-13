import 'package:flowza/cubits/lend/cubit/lend_cubit.dart';
import 'package:flowza/models/land/lend_model.dart';
import 'package:flowza/theme/colors_app.dart';
import 'package:flowza/widgets/build_app_bar.dart';
import 'package:flowza/widgets/build_navigation_bar.dart';
import 'package:flowza/widgets/category_list.dart';
import 'package:flowza/widgets/container_total.dart';
import 'package:flowza/widgets/contents_container_borrowed/container_show_data.dart';
import 'package:flowza/widgets/contents_container_borrowed/format_sheet_borrowed.dart';
import 'package:flowza/widgets/show_data_is_Empty.dart';
import 'package:flowza/widgets/title_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LendView extends StatelessWidget {
  const LendView({super.key});

  static const String id = "/lend";
  @override
  Widget build(BuildContext context) {
    final box = Hive.box<LendModel>('lends');
    return Scaffold(
      extendBody: true,
      appBar: buildAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
          child: BlocSelector<LendCubit, LendState, int>(
            selector: (state) {
              return context.read<LendCubit>().selectedCategory;
            },
            builder: (context, selectedCategory) {
              return ValueListenableBuilder(
                valueListenable: box.listenable(),
                builder: (context, Box<LendModel> box, _) {
                  final lends = box.values.toList();
                  if (lends.isEmpty) {
                    return const ShowDataIsEmpty(
                      text: "You haven't lend any money yet",
                      image: "assets/images/lend.svg",
                    );
                  }
                  final filterLend = selectedCategory == 0
                      ? lends
                      : selectedCategory == 1
                      ? lends.where((e) => e.isPaid).toList()
                      : lends.where((e) => !e.isPaid).toList();
                  //sort based on date
                  filterLend.sort((a, b) => a.lendDate.compareTo(b.lendDate));
                  final total = context.read<LendCubit>().calculatTotal(
                    filterLend,
                  );
                  return CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      SliverToBoxAdapter(
                        child: ContainerTotal(
                          title: 'Total Lend Amount',
                          total: total,
                        ),
                      ),
                      const SliverToBoxAdapter(child: SizedBox(height: 40)),

                      // Title
                      const SliverToBoxAdapter(
                        child: TitleView(
                          title: 'Lend History',
                          subTitle: 'Track your lend and repayments',
                        ),
                      ),
                      const SliverToBoxAdapter(child: SizedBox(height: 24)),
                      SliverToBoxAdapter(
                        child: CategoryList(
                          selectedCategory: selectedCategory,
                          onTap: (index) {
                            context.read<LendCubit>().selectCategory(index);
                          },
                        ),
                      ),
                      const SliverToBoxAdapter(child: SizedBox(height: 24)),
                      SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          final item = filterLend[index];

                          final originalIndex = box.values.toList().indexOf(
                            item,
                          );

                          return ContainerShowData(
                            name: item.name,
                            amount: item.amount,
                            currency: item.currency,
                            isPaid: item.isPaid,
                            date1: item.lendDate,
                            date2: item.returnDate,

                            // delete
                            onDelete: () {
                              context.read<LendCubit>().removeLend(
                                originalIndex,
                                item.notificationId,
                              );
                            },

                            // toggle paid
                            onTogglePaid: () {
                              context.read<LendCubit>().selectPaidLend(
                                originalIndex,
                                item,
                              );
                            },
                            typeMoney: 'LEND DATE',
                          );
                        }, childCount: filterLend.length),
                      ),
                      const SliverToBoxAdapter(child: SizedBox(height: 50)),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: const BuildNavigationBar(selectIndex: 1),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: ColorsApp.backGroundColor,
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: ColorsApp.appColor,
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return const FormatSheetBorrowed(typeMoney: 'Lend');
            },
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
