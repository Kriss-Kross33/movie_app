part of 'signup_form.dart';

class _SignupButton extends StatelessWidget {
  const _SignupButton({required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: !state.isValid ? Colors.grey : null,
            borderRadius: BorderRadius.circular(30),
            gradient: !state.isValid
                ? null
                : LinearGradient(
                    colors: [
                      AppColor.royalBlue,
                      AppColor.violet,
                    ],
                  ),
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: state.status.isInProgress
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CupertinoActivityIndicator(
                        color: Colors.amber,
                      ),
                      SizedBox(
                        width: Sizes.dimen_8.w,
                      ),
                      Text('Sign up'),
                    ],
                  )
                : Text('Sign up'),
            onPressed: !state.isValid
                ? null
                : () => context.read<SignupCubit>().onSignupButtonPressed(),
          ),
        );
      },
    );
  }
}
