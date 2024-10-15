import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home/presentation/bloc/home_page_bloc.dart';
import 'package:latihan_aplikasi_manajemen_kelas/features/home/presentation/widget/schedule_bottom_sheets.dart';

import '../../../../core/themes/colors.dart';

class ScheduleWidget extends StatelessWidget {
  const ScheduleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocConsumer<HomePageBloc, HomePageState>(
          bloc: context.read<HomePageBloc>()
            ..add(
              GetScheduleEvent(
                DateTime.now().weekday - 1,
              ),
            ),
          listener: (context, state) {},
          builder: (context, state) {
            if (state is HomePageInitial) {
              return const Center(child: Text('No data yet'));
            } else if (state is HomePageLoading) {
              return const Center(
                child: SizedBox(
                  width: 15,
                  height: 15,
                  child: CircularProgressIndicator(
                    color: ColorsResources.primaryButton,
                    strokeWidth: 2.5,
                  ),
                ),
              );
            } else if (state is HomePageFailure) {
              return Center(child: Text(state.failure.message));
            } else if (state is HomePageLoaded) {
              return ListView.builder(
                itemCount: state.schedules.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final schedule = state.schedules[index];
                  DateTime jamMulaiDateTime =
                      DateFormat('HH:mm:ss').parse(schedule.jamMulai);
                  String formattedTime =
                      DateFormat('HH:mm').format(jamMulaiDateTime);

                  return _buildItem(
                    onTap: () => scheduleBottomSheets(context, schedule),
                    time: formattedTime,
                    subject: schedule.pelajaran,
                    teacher: schedule.guru,
                    room: schedule.ruang,
                    day: schedule.hari,
                  );
                },
              );
            } else if (state is HomePageLoaded) {
              return ListView.builder(
                itemCount: state.schedules.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final schedule = state.schedules[index];
                  DateTime jamMulaiDateTime =
                      DateFormat('HH:mm:ss').parse(schedule.jamMulai);
                  String formattedTime =
                      DateFormat('HH:mm').format(jamMulaiDateTime);

                  return _buildItem(
                    onTap: () => scheduleBottomSheets(context, schedule),
                    time: formattedTime,
                    subject: schedule.pelajaran,
                    teacher: schedule.guru,
                    room: schedule.ruang,
                    day: schedule.hari,
                  );
                },
              );
            } else {
              return const Center(child: Text('Other State'));
            }
          },
        ),
      ],
    );
  }
}

Widget _buildItem({
  String? time,
  String? subject,
  String? teacher,
  String? room,
  String? day,
  void Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 65,
          child: Text(
            "$time",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(top: 3, left: 3, bottom: 5),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: Colors.grey[500]!, width: 1),
                top: BorderSide(color: Colors.grey[500]!, width: 1),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              decoration: BoxDecoration(
                  color: ColorsResources.primaryButton,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$subject",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(children: [
                    const Icon(
                      Icons.developer_board_rounded,
                      color: Colors.white,
                      size: 16,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "$teacher",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    )
                  ]),
                  const SizedBox(height: 8),
                  Row(children: [
                    const Icon(
                      Icons.location_on_rounded,
                      color: Colors.white,
                      size: 16,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "$room",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    )
                  ]),
                  const SizedBox(height: 6),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
