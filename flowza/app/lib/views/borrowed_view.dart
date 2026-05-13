import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flowza/cubits/borrowed/cubit/borrowed_cubit.dart';
import 'package:flowza/models/borrowed/borrowed_model.dart';
import 'package:flowza/theme/colors_app.dart';
import 'package:flowza/widgets/build_app_bar.dart';
import 'package:flowza/widgets/build_navigation_bar.dart';
import 'package:flowza/widgets/category_list.dart';
import 'package:flowza/widgets/contents_container_borrowed/container_show_data.dart';
import 'package:flowza/widgets/container_total.dart';
import 'package:flowza/widgets/contents_container_borrowed/format_sheet_borrowed.dart';
import 'package:flowza/widgets/show_data_is_Empty.dart';
import 'package:flowza/widgets/title_view.dart';

class BorrowedView extends StatelessWidget {
  const BorrowedView({super.key});

  static const String id = "/borrowed";

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<BorrowedModel>('borroweds');

    return Scaffold(
      extendBody: true,
      appBar: buildAppBar(),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
          child: BlocSelector<BorrowedCubit, BorrowedState, int>(
            selector: (state) {
              return context.read<BorrowedCubit>().selectedCategory;
            },
            builder: (context, selectedCategory) {
              // Hive reactive UI
              return ValueListenableBuilder(
                valueListenable: box.listenable(),
                builder: (context, Box<BorrowedModel> box, _) {
                  final borroweds = box.values.toList();

                  // Empty state
                  if (borroweds.isEmpty) {
                    return const ShowDataIsEmpty(
                      text: "You haven't borrowed any money yet",
                      image: "assets/images/borrowed.svg",
                    );
                  }

                  // Filter
                  final filteredBorroweds = selectedCategory == 0
                      ? borroweds
                      : selectedCategory == 1
                      ? borroweds.where((e) => e.isPaid).toList()
                      : borroweds.where((e) => !e.isPaid).toList();
                  //sort based on date
                  filteredBorroweds.sort(
                    (a, b) => a.borrowedDate.compareTo(b.borrowedDate),
                  );

                  // Total
                  final total = context.read<BorrowedCubit>().calculatTotal(
                    filteredBorroweds,
                  );

                  return CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      // Total
                      SliverToBoxAdapter(
                        child: ContainerTotal(
                          title: 'Total Borrowed Amount',
                          total: total,
                        ),
                      ),

                      const SliverToBoxAdapter(child: SizedBox(height: 40)),

                      // Title
                      const SliverToBoxAdapter(
                        child: TitleView(
                          title: 'Borrowed History',
                          subTitle: 'Track your debts and repayments',
                        ),
                      ),

                      const SliverToBoxAdapter(child: SizedBox(height: 24)),

                      // Categories
                      SliverToBoxAdapter(
                        child: CategoryList(
                          selectedCategory: selectedCategory,
                          onTap: (index) {
                            context.read<BorrowedCubit>().selectCategory(index);
                          },
                        ),
                      ),

                      const SliverToBoxAdapter(child: SizedBox(height: 24)),

                      // List
                      SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          final item = filteredBorroweds[index];

                          final originalIndex = box.values.toList().indexOf(
                            item,
                          );

                          return ContainerShowData(
                            name: item.name,
                            amount: item.amount,
                            currency: item.currency,
                            isPaid: item.isPaid,
                            date1: item.borrowedDate,
                            date2: item.returnDate,

                            // delete
                            onDelete: () {
                              context.read<BorrowedCubit>().removeBorrowed(
                                originalIndex,
                                item.notificationId,
                              );
                            },

                            // toggle paid
                            onTogglePaid: () {
                              context.read<BorrowedCubit>().selectPaidBorrowed(
                                originalIndex,
                                item,
                              );
                            },
                            typeMoney: 'BORROWED DATE',
                          );
                        }, childCount: filteredBorroweds.length),
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

      // FAB
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: ColorsApp.backGroundColor,
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: ColorsApp.appColor,
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return const FormatSheetBorrowed(typeMoney: 'Borrowed');
            },
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),

      bottomNavigationBar: const BuildNavigationBar(selectIndex: 0),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
