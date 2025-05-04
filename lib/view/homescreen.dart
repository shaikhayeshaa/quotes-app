import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/components/main_button.dart';
import 'package:quotes_app/viewmodel/quotes_viewmodel.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<QuoteViewModel>(context);
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/bg.jpeg',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 4.w, top: 6.h, bottom: 2.h),
                child: Text(
                  'Quotes',
                  style: GoogleFonts.poppins(
                    fontSize: 50,
                    color: const Color.fromARGB(255, 69, 5, 81),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Category',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      viewModel.quote?.category ?? 'Unknown',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  height: 50.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(16),
                  child: viewModel.isLoading
                      ? Lottie.asset(
                          'assets/Animation - 1746291280579.json',
                          height: 50.h,
                          width: 80.w,
                        )
                      : viewModel.quote == null
                          ? Center(
                              child: Text(
                                'Press the button to get a quote.',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )
                          : SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '- ${viewModel.quote!.author}',
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                  Text(
                                    '"${viewModel.quote!.quote}"',
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontStyle: FontStyle.italic,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
                child: MainButton(
                  onPress: viewModel.loadQuote,
                  title: 'Get Quote',
                  loading: viewModel.isLoading,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
