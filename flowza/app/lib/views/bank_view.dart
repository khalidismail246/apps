import 'package:flowza/cubits/bank/cubit/bank_cubit.dart';
import 'package:flowza/models/bank/bank_model.dart';
import 'package:flowza/theme/colors_app.dart';
import 'package:flowza/widgets/build_app_bar.dart';
import 'package:flowza/widgets/build_navigation_bar.dart';
import 'package:flowza/widgets/container_total.dart';
import 'package:flowza/widgets/content_container_bank/category_list_bank.dart';
import 'package:flowza/widgets/content_container_bank/container_show_data_bank.dart';
import 'package:flowza/widgets/content_container_bank/format_sheet_bank.dart';
import 'package:flowza/widgets/show_data_is_Empty.dart';
import 'package:flowza/widgets/title_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BankView extends StatelessWidget {
  const BankView({super.key});

  static const String id = "/bank";
  @override
  Widget build(BuildContext context) {
    final box = Hive.box<BankModel>('banks');
    return Scaffold(
      extendBody: true,
      appBar: buildAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
          child: BlocSelector<BankCubit, BankState, int>(
            selector: (state) {
              return context.read<BankCubit>().selectedCategory;
            },
            builder: (context, selectedCategory) {
              // Hive reactive UI
              return ValueListenableBuilder(
                valueListenable: box.listenable(),
                builder: (context, Box<BankModel> box, _) {
                  final banks = box.values.toList();

                  // Empty state
                  if (banks.isEmpty) {
                    return const ShowDataIsEmpty(
                      text: "No Bank Certificates Added Yet",
                      image: "assets/images/bank.svg",
                    );
                  }

                  // Filter
                  final filteredBanks = selectedCategory == 0
                      ? banks
                      : selectedCategory == 1
                      ? banks
                            .where((e) => e.certificateType == "monthly")
                            .toList()
                      : banks
                            .where((e) => e.certificateType == "yearly")
                            .toList();
                  //sort based on date
                  filteredBanks.sort(
                    (a, b) => a.startDate.compareTo(b.startDate),
                  );

                  // Total
                  final total = context.read<BankCubit>().calculatTotal(
                    filteredBanks,
                  );

                  return CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      // Total
                      SliverToBoxAdapter(
                        child: ContainerTotal(
                          title: 'Total Bank Amount',
                          total: total,
                        ),
                      ),

                      const SliverToBoxAdapter(child: SizedBox(height: 40)),

                      // Title
                      const SliverToBoxAdapter(
                        child: TitleView(
                          title: 'Bank History',
                          subTitle: 'Track your bank certificates',
                        ),
                      ),

                      const SliverToBoxAdapter(child: SizedBox(height: 24)),

                      // Categories
                      SliverToBoxAdapter(
                        child: CategoryListBank(
                          selectedCategory: selectedCategory,
                          onTap: (index) {
                            context.read<BankCubit>().selectCategory(index);
                          },
                        ),
                      ),

                      const SliverToBoxAdapter(child: SizedBox(height: 24)),

                      // List
                      SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          final item = filteredBanks[index];

                          final originalIndex = box.values.toList().indexOf(
                            item,
                          );

                          return ContainerShowDataBank(
                            bankModel: item,

                            // delete
                            onDelete: () {
                              context.read<BankCubit>().removeBank(
                                originalIndex,
                                item.notificationId,
                              );
                            },
                          );
                        }, childCount: filteredBanks.length),
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
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: ColorsApp.backGroundColor,
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: ColorsApp.appColor,
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return const FormatSheetBank();
            },
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BuildNavigationBar(selectIndex: 2),
    );
  }
}
