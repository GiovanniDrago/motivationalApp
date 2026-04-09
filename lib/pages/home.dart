import 'package:flutter/material.dart';
import 'package:motivational_app/l10n/app_localizations.dart';
import 'package:motivational_app/pages/home_body.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
    required this.onLocaleSelected,
  });

  final ValueChanged<Locale> onLocaleSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        actions: [
          _LanguageMenu(onLocaleSelected: onLocaleSelected),
        ],
      ),
      body: const HomeBody(),
    );
  }
}

class _LanguageMenu extends StatefulWidget {
  const _LanguageMenu({required this.onLocaleSelected});

  final ValueChanged<Locale> onLocaleSelected;

  @override
  State<_LanguageMenu> createState() => _LanguageMenuState();
}

class _LanguageMenuState extends State<_LanguageMenu> {
  final MenuController _menuController = MenuController();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final currentLanguageCode = Localizations.localeOf(context).languageCode;

    return MenuAnchor(
      controller: _menuController,
      alignmentOffset: const Offset(-12, 8),
      menuChildren: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: SizedBox(
            width: 180,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.languageMenuLabel,
                  style: theme.textTheme.labelLarge,
                ),
                const SizedBox(height: 8),
                DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: currentLanguageCode == 'it' ? 'it' : 'en',
                    items: [
                      DropdownMenuItem<String>(
                        value: 'en',
                        child: Text(l10n.languageEnglish),
                      ),
                      DropdownMenuItem<String>(
                        value: 'it',
                        child: Text(l10n.languageItalian),
                      ),
                    ],
                    onChanged: (value) {
                      if (value == null) {
                        return;
                      }

                      widget.onLocaleSelected(Locale(value));
                      _menuController.close();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
      builder: (context, controller, child) {
        return IconButton(
          tooltip: l10n.languageMenuLabel,
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          icon: const Icon(Icons.more_vert_rounded),
        );
      },
    );
  }
}
