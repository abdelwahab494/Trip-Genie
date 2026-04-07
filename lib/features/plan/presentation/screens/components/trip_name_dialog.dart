import 'package:trip_genie/core/manager/app_imports.dart';

class TripNameDialog extends StatefulWidget {
  const TripNameDialog({super.key});

  @override
  State<TripNameDialog> createState() => _TripNameDialogState();
}

class _TripNameDialogState extends State<TripNameDialog> with FormHelperMixin {
  @override
  Widget build(BuildContext context) {
    final S s = S.of(context);
    return AlertDialog(
      title: Text(s.saveYourTrip),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(s.giveyourtripanametosaveitforlater),
            Gap(AppSizes.h20),
            TextFormField(
              controller: nameC,
              autofocus: true,
              decoration: InputDecoration(hintText: s.egSummerinCairo),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: TextButton.styleFrom(
            textStyle: AppFonts.inter14SemiBold(context),
          ),
          child: Text(s.cancle),
        ),
        ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              Navigator.of(context).pop(nameC.text.trim());
            }
          },
          style: ElevatedButton.styleFrom(
            textStyle: AppFonts.inter14SemiBold(context),
            padding: EdgeInsets.symmetric(
              vertical: AppSizes.h8,
              horizontal: AppSizes.w16,
            ),
            backgroundColor: context.primary,
            foregroundColor: context.secBackground,
          ),
          child: Text(s.save),
        ),
      ],
    );
  }
}
