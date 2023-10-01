import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/config/icons/icons_broken.dart';
import 'package:ketaby/core/utils/app_colors.dart';
import 'package:ketaby/core/widgets/custom_back_button.dart';
import 'package:ketaby/feature/home/presentation/cubits/books_cubit/books_cubit.dart';
import 'package:ketaby/feature/home/presentation/cubits/books_cubit/books_state.dart';
import 'package:ketaby/feature/home/presentation/views/widgets/books_view_body.dart';
import 'package:ketaby/feature/home/presentation/views/widgets/search_text_field.dart';

class BooksView extends StatefulWidget {
  const BooksView({Key? key}) : super(key: key);

  @override
  State<BooksView> createState() => _BooksViewState();
}

class _BooksViewState extends State<BooksView> {

  @override
  void initState() {
    BooksCubit.get(context).getBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksCubit, BooksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: const CustomBackButton(),
            title: BooksCubit.get(context).isSearching
                ? SearchTextField(
                    controller: BooksCubit.get(context).searchController,
                    onChange: (value) {
                      if (!value.startsWith(' ')) {
                        BooksCubit.get(context).getSearchedDoctorsList(
                          bookName: value,
                        );
                      }
                    },
                  )
                : const Text('Books'),
            actions: [
              BooksCubit.get(context).isSearching
                  ? IconButton(
                      onPressed: () {
                        BooksCubit.get(context).stopSearch();
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.clear,
                        color: AppColors.indigo,
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        BooksCubit.get(context).startSearch(context);
                      },
                      icon: const Icon(
                        IconBroken.Search,
                        color: AppColors.indigo,
                      ),
                    ),
            ],
          ),
          body: const BooksViewBody(),
        );
      },
    );
  }
}


