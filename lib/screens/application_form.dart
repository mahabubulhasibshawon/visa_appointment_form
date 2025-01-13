import 'package:flutter/material.dart';

class ApplicationForm extends StatelessWidget {
  const ApplicationForm({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    bool isDesktop = width> 500;

    TextStyle headline = TextStyle(
      fontSize: isDesktop ? 30 : 22,
      fontWeight: FontWeight.bold
    );

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal : isDesktop? width * .1 :20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Croatia', style: TextStyle(fontSize:isDesktop ? width * .05:  width * .07),),
              SizedBox(height: height * .01),
              Text('Applicant 1', style: headline),
              SizedBox(height: height * .01),
              const Text('First name'),
              SizedBox(height: height * .01),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your first name',
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: height * .01),
              const Text('Last name'),
              SizedBox(height: height * .01),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Enter your Last name',
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: height * .01),
              // Gender and Date of Birth
              Row(
                children: [
                  // Gender Dropdown
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Gender',
                          style: TextStyle(),
                        ),
                        SizedBox(height: height * .01),
                        DropdownButtonFormField<String>(
                          items: const [
                            DropdownMenuItem(value: 'Male', child: Text('Male')),
                            DropdownMenuItem(value: 'Female', child: Text('Female')),
                            DropdownMenuItem(value: 'Other', child: Text('Other')),
                          ],
                          onChanged: (value) {},
                          decoration: const InputDecoration(
                            hintText: 'Select',
                            border: OutlineInputBorder(
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: height * .01),
          
                  // Date of Birth
                  const Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date Of Birth',
                          style: TextStyle(),
                        ),
                        SizedBox(height: 8),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'DD/MM/YYYY',
                            border: OutlineInputBorder(
                            ),
                          ),
                          keyboardType: TextInputType.datetime,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Current Nationality
              const Text(
                'Current Nationality',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                items: const [
                  DropdownMenuItem(value: 'Bangladesh', child: Text('Bangladesh')),
                  DropdownMenuItem(value: 'Canada', child: Text('Canada')),
                  DropdownMenuItem(value: 'Chaina', child: Text('Chaina')),
                ],
                onChanged: (value) {},
                decoration: const InputDecoration(
                  hintText: 'Select',
                  border: OutlineInputBorder(
                  ),
                ),
              ),
              SizedBox(height: height * .01),
              // passport number and expiry date
              Row(
                children: [
                  // Passport number
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Gender',
                          style: TextStyle(),
                        ),
                        SizedBox(height: height * .01),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Enter passport number',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: height * .01),
          
                  // Passport Expiry Date
                  const Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Passport Expiry Date',
                          style: TextStyle(),
                        ),
                        SizedBox(height: 8),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'DD/MM/YYYY',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.datetime,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * .02),
              const Divider(),
              SizedBox(height: height * .02),
              Text('Contact Details', style: headline,),
              SizedBox(height: height * .01),
              const Text('Contact number'),
              SizedBox(height: height * .01),
              Row(
                children: [
                  Expanded(
                    flex: isDesktop ? 2 :1,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: '+880',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: height * .01),
                  Expanded(
                    flex: isDesktop ? 20 : 6,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: '',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * .01),
              const Text('Email'),
              SizedBox(height: height * .01),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Enter Email Address',
                    border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: height * .02),
              const Divider(),
              SizedBox(height: height * .02),
              Text('Form Details',style: headline),
              SizedBox(height: height * .01),
              // visa type and sub categry
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Visa Type',
                          style: TextStyle(),
                        ),
                        SizedBox(height: height * .01),
                        DropdownButtonFormField<String>(
                          items: const [
                            DropdownMenuItem(value: 'Tourist', child: Text('Tourist')),
                            DropdownMenuItem(value: 'Transit', child: Text('Transit')),
                            DropdownMenuItem(value: 'Medical', child: Text('Medical')),
                            DropdownMenuItem(value: 'Student', child: Text('Student')),
                            DropdownMenuItem(value: 'Other', child: Text('Other')),
                          ],
                          onChanged: (value) {},
                          decoration: const InputDecoration(
                            hintText: 'Select',
                            border: OutlineInputBorder(
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: height * .01),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Visa SubCategory',
                          style: TextStyle(),
                        ),
                        SizedBox(height: height * .01),
                        DropdownButtonFormField<String>(
                          items: const [
                            DropdownMenuItem(value: 'Male', child: Text('Male')),
                            DropdownMenuItem(value: 'Female', child: Text('Female')),
                            DropdownMenuItem(value: 'Other', child: Text('Other')),
                          ],
                          onChanged: (value) {},
                          decoration: const InputDecoration(
                            hintText: 'Select',
                            border: OutlineInputBorder(
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * .01),
              // Price and Comment
              Row(
                children: [
                  // Price
                  Expanded(
                    flex: 1,
                    child: _inputBox(height, 'Price', '0'),
                  ),
                  SizedBox(width: height * .01),
                  // comment
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Comment',
                          style: TextStyle(),
                        ),
                        SizedBox(height: height * .01),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Enter your comment',
                            border: OutlineInputBorder(),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * .01),
              // min gap min date, max date
              Row(
                children: [
                  // min gap
                  Expanded(
                    flex: 1,
                    child: _inputBox(height, 'Min gap', '0'),
                  ),
                  SizedBox(width: height * .01),
                  // min date
                  const Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Min Date',
                          style: TextStyle(),
                        ),
                        SizedBox(height: 8),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'DD/MM/YYYY',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.datetime,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: height * .01),
                  // max date
                  const Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Max Date',
                          style: TextStyle(),
                        ),
                        SizedBox(height: 8),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'DD/MM/YYYY',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.datetime,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * .05),
              // button
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: height * .05,
                  decoration: BoxDecoration(
                    color: const Color(0xFFcb4e18),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Center(child: Text('Save Data', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
                ),
              ),
              SizedBox(height: height * .1),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _inputBox(double height, String text, String hintText) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        text,
        style: const TextStyle(),
      ),
      SizedBox(height: height * .01),
      TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
      )
    ],
  );
}

