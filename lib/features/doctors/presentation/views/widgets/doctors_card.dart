import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liver_diagnosis/core/utils/app_color.dart';
import 'package:liver_diagnosis/features/checkout/data/models/doctors_model.dart';
import 'package:liver_diagnosis/features/doctors/presentation/views/map_view.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    super.key,
    required this.doctors,
  });

  final DoctorsModel doctors;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.kPrimaryColor.withValues(alpha: .5),
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColor.kPrimaryColor,
                  width: 2.w,
                ),
              ),
              child: ClipOval(
                child: CircleAvatar(
                  radius: 60.r,
                  backgroundColor: Colors.white,
                  child: doctors.image.isEmpty
                      ? Icon(
                          Icons.image_not_supported,
                          color: Colors.grey,
                          size: 60.sp,
                        )
                      : Image.network(
                          doctors.image,
                          fit: BoxFit.cover,
                          width: 120.w,
                          height: 120.h,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(
                              Icons.image_not_supported,
                              color: Colors.grey,
                              size: 50.sp,
                            );
                          },
                        ),
                ),
              ),
            ),
          ),
          SizedBox(width: 13.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Name: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                      TextSpan(
                        text: doctors.name,
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Age: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                      TextSpan(
                        text: doctors.age.toString(),
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Governorate: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                      TextSpan(
                        text: doctors.governorate,
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Address: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                      TextSpan(
                        text: doctors.location,
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                // Phone number (added here before View Location)
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Phone: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                      TextSpan(
                        text: '+20 ${doctors.phone}',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'View Location: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MapScreen(
                                  lat: doctors.latitude,
                                  long: doctors.longitude,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            'View',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: AppColor.kPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
