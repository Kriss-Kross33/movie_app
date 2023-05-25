part of 'login_form.dart';

class _LoginButton extends StatelessWidget {
  const _LoginButton({required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
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
                      Text('Login'),
                    ],
                  )
                : Text('Login'),
            onPressed: !state.isValid
                ? null
                : () => context.read<LoginCubit>().onLoginButtonPressed(),
          ),
        );
      },
    );
  }
}
