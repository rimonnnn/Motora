// features/add_car/presentation/views/add_car_screen.dart
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motora/core/utils/app_text_style_exctention.dart';
import 'package:motora/core/widgets/spacing_widgets.dart';
import 'package:motora/features/add_car/cubit/add_car_cubit.dart';
import 'package:motora/features/add_car/rebo/add_car_rebo_impl.dart';

class AddCarScreen extends StatelessWidget {
  const AddCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddCarCubit(AddCarRepositoryImpl()),
      child: const _AddCarView(),
    );
  }
}

class _AddCarView extends StatefulWidget {
  const _AddCarView();

  @override
  State<_AddCarView> createState() => _AddCarViewState();
}

class _AddCarViewState extends State<_AddCarView> {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();

  static const _categories = ['Sedan', 'SUV', 'Sports', 'Electric'];

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _pickImage(AddCarCubit cubit) async {
    final picked = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 80, // compress on pick, avoid huge uploads later
    );
    if (picked != null) cubit.setImage(File(picked.path));
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final cubit = context.read<AddCarCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Car', style: context.black16SemiBold),
        backgroundColor: colors.surface,
        foregroundColor: colors.onSurface,
        elevation: 0,
      ),
      body: BlocConsumer<AddCarCubit, AddCarState>(
        listener: (context, state) {
          if (state is AddCarSuccess) {
            Navigator.of(context).pop();
          } else if (state is AddCarFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: colors.error,
              ),
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is AddCarLoading;

          return SingleChildScrollView(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image picker — tap the box to open gallery
                Material(
                  color: colors.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(12.r),
                  child: InkWell(
                    onTap: () => _pickImage(cubit),
                    borderRadius: BorderRadius.circular(12.r),
                    child: Container(
                      width: double.infinity,
                      height: 160.h,
                      alignment: Alignment.center,
                      child: cubit.imageFile == null
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.add_a_photo_outlined,
                                  size: 32.sp,
                                  color: colors.onSurfaceVariant,
                                ),
                                HeightSpace(8),
                                Text(
                                  'اختر صورة السيارة',
                                  style: context.grey12Medium,
                                ),
                              ],
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(12.r),
                              child: Image.file(
                                cubit.imageFile!,
                                width: double.infinity,
                                height: 160.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),
                ),

                HeightSpace(20),

                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'اسم السيارة'),
                ),
                HeightSpace(16),

                TextField(
                  controller: _priceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'السعر'),
                ),
                HeightSpace(16),

                DropdownButtonFormField<String>(
                  initialValue: cubit.selectedCategory,
                  decoration: const InputDecoration(labelText: 'الفئة'),
                  items: _categories
                      .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) cubit.setCategory(value);
                  },
                ),
                HeightSpace(16),

                TextField(
                  controller: _descriptionController,
                  maxLines: 4,
                  decoration: const InputDecoration(labelText: 'الوصف'),
                ),
                HeightSpace(24),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: isLoading
                        ? null
                        : () => cubit.submit(
                            name: _nameController.text,
                            priceText: _priceController.text,
                            description: _descriptionController.text,
                          ),
                    child: isLoading
                        ? SizedBox(
                            width: 20.w,
                            height: 20.w,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: colors.onPrimary,
                            ),
                          )
                        : const Text('Submit'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
