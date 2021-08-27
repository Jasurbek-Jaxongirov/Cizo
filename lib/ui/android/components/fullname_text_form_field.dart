// class FullNameTextFormField extends StatelessWidget {
//   const FullNameTextFormField({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       onChanged: (_) {
//         _activate();
//       },
//       validator: (value) {
//         if (value == '' || value == null) {
//           return 'Name is required!';
//         } else if (value.length <= 3) {
//           return 'Name must be more than three characters';
//         }
//       },
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       decoration: Constants.inputSignUpDecoration(
//           fullname: 'Enter your full name',
//           prefixIcon: Icons.person_outline_outlined),
//     );
//   }
// }



// class LabelText extends StatelessWidget {
//   const LabelText({
//     Key? key,
//     required this.textStyle,required this.text,
//   }) : super(key: key);

//   final TextStyle textStyle;
//   final String text;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 20, bottom: 8),
//       child: Text(
//         'E-mail Address',
//         style: textStyle,
//       ),
//     );
//   }
// }
