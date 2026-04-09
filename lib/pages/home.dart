import 'package:flutter/material.dart';
import 'package:motivational_app/app_distribution.dart';
import 'package:motivational_app/l10n/app_localizations.dart';
import 'package:motivational_app/pages/home_body.dart';
import 'package:motivational_app/pages/interactions/about_dialog.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
    required this.onLocaleSelected,
    required this.distribution,
  });

  final ValueChanged<Locale> onLocaleSelected;
  final AppDistributionConfig distribution;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        actions: [
          _AppMenu(
            onLocaleSelected: onLocaleSelected,
            distribution: distribution,
          ),
        ],
      ),
      body: const HomeBody(),
    );
  }
}

class _AppMenu extends StatefulWidget {
  const _AppMenu({
    required this.onLocaleSelected,
    required this.distribution,
  });

  final ValueChanged<Locale> onLocaleSelected;
  final AppDistributionConfig distribution;

  @override
  State<_AppMenu> createState() => _AppMenuState();
}

class _AppMenuState extends State<_AppMenu> {
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
        MenuItemButton(
          leadingIcon: const Icon(Icons.info_outline_rounded),
          onPressed: () async {
            _menuController.close();
            await showDialog<void>(
              context: context,
              builder: (context) => AboutDialogContent(
                distribution: widget.distribution,
              ),
            );
          },
          child: Text(l10n.aboutMenuItem),
        ),
        const Divider(height: 1),
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
          tooltip: l10n.moreMenuTooltip,
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
