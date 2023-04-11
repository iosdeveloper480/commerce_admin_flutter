import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

const double _kLeadingWidth =
    kToolbarHeight; // So the leading button is square.
const double _kMaxTitleTextScaleFactor =
    1.34; // TODO(perc): Add link to Material spec when available, https://github.com/flutter/flutter/issues/58769.

class WAAppBar2 extends StatefulWidget implements PreferredSizeWidget {
  WAAppBar2({
    super.key,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.title,
    this.actions,
    this.flexibleSpace,
    this.bottom,
    this.elevation,
    this.scrolledUnderElevation,
    this.notificationPredicate = defaultScrollNotificationPredicate,
    this.shadowColor,
    this.surfaceTintColor,
    this.shape,
    this.backgroundColor,
    this.foregroundColor,
    @Deprecated(
      'This property is no longer used, please use systemOverlayStyle instead. '
      'This feature was deprecated after v2.4.0-0.0.pre.',
    )
        this.brightness,
    this.iconTheme,
    this.actionsIconTheme,
    @Deprecated(
      'This property is no longer used, please use toolbarTextStyle and titleTextStyle instead. '
      'This feature was deprecated after v2.4.0-0.0.pre.',
    )
        this.textTheme,
    this.primary = true,
    this.centerTitle,
    this.excludeHeaderSemantics = false,
    this.titleSpacing,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
    this.toolbarHeight,
    this.leadingWidth,
    @Deprecated(
      'This property is obsolete and is false by default. '
      'This feature was deprecated after v2.4.0-0.0.pre.',
    )
        this.backwardsCompatibility,
    this.toolbarTextStyle,
    this.titleTextStyle,
    this.systemOverlayStyle,
  })  : assert(automaticallyImplyLeading != null),
        assert(elevation == null || elevation >= 0.0),
        assert(notificationPredicate != null),
        assert(primary != null),
        assert(toolbarOpacity != null),
        assert(bottomOpacity != null),
        preferredSize =
            _PreferredAppBarSize(toolbarHeight, bottom?.preferredSize.height);
  static double preferredHeightFor(BuildContext context, Size preferredSize) {
    if (preferredSize is _PreferredAppBarSize &&
        preferredSize.toolbarHeight == null) {
      return (AppBarTheme.of(context).toolbarHeight ?? kToolbarHeight) +
          (preferredSize.bottomHeight ?? 0);
    }
    return preferredSize.height;
  }

  final Widget? leading;
  final bool automaticallyImplyLeading;
  final Widget? title;
  final List<Widget>? actions;
  final Widget? flexibleSpace;
  final PreferredSizeWidget? bottom;
  final double? elevation;
  final double? scrolledUnderElevation;
  final ScrollNotificationPredicate notificationPredicate;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final ShapeBorder? shape;
  final Color? backgroundColor;
  final Color? foregroundColor;
  @Deprecated(
    'This property is no longer used, please use systemOverlayStyle instead. '
    'This feature was deprecated after v2.4.0-0.0.pre.',
  )
  final Brightness? brightness;
  final IconThemeData? iconTheme;
  final IconThemeData? actionsIconTheme;
  @Deprecated(
    'This property is no longer used, please use toolbarTextStyle and titleTextStyle instead. '
    'This feature was deprecated after v2.4.0-0.0.pre.',
  )
  final TextTheme? textTheme;
  final bool primary;
  final bool? centerTitle;
  final bool excludeHeaderSemantics;
  final double? titleSpacing;
  final double toolbarOpacity;
  final double bottomOpacity;
  @override
  final Size preferredSize;
  final double? toolbarHeight;
  final double? leadingWidth;
  @Deprecated(
    'This property is obsolete and is false by default. '
    'This feature was deprecated after v2.4.0-0.0.pre.',
  )
  final bool? backwardsCompatibility;
  final TextStyle? toolbarTextStyle;
  final TextStyle? titleTextStyle;
  final SystemUiOverlayStyle? systemOverlayStyle;

  bool _getEffectiveCenterTitle(ThemeData theme) {
    bool platformCenter() {
      assert(theme.platform != null);
      switch (theme.platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
        case TargetPlatform.linux:
        case TargetPlatform.windows:
          return false;
        case TargetPlatform.iOS:
        case TargetPlatform.macOS:
          return actions == null || actions!.length < 2;
      }
    }

    return centerTitle ?? theme.appBarTheme.centerTitle ?? platformCenter();
  }

  @override
  State<WAAppBar2> createState() => _WAAppBar2State();
}

class _WAAppBar2State extends State<WAAppBar2> {
  ScrollNotificationObserverState? _scrollNotificationObserver;
  bool _scrolledUnder = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scrollNotificationObserver?.removeListener(_handleScrollNotification);
    _scrollNotificationObserver = ScrollNotificationObserver.maybeOf(context);
    _scrollNotificationObserver?.addListener(_handleScrollNotification);
  }

  @override
  void dispose() {
    if (_scrollNotificationObserver != null) {
      _scrollNotificationObserver!.removeListener(_handleScrollNotification);
      _scrollNotificationObserver = null;
    }
    super.dispose();
  }

  void _handleDrawerButton() {
    Scaffold.of(context).openDrawer();
  }

  void _handleDrawerButtonEnd() {
    Scaffold.of(context).openEndDrawer();
  }

  void _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification &&
        widget.notificationPredicate(notification)) {
      final bool oldScrolledUnder = _scrolledUnder;
      final ScrollMetrics metrics = notification.metrics;
      switch (metrics.axisDirection) {
        case AxisDirection.up:
          // Scroll view is reversed
          _scrolledUnder = metrics.extentAfter > 0;
          break;
        case AxisDirection.down:
          _scrolledUnder = metrics.extentBefore > 0;
          break;
        case AxisDirection.right:
        case AxisDirection.left:
          // Scrolled under is only supported in the vertical axis.
          _scrolledUnder = false;
          break;
      }

      if (_scrolledUnder != oldScrolledUnder) {
        setState(() {
          // React to a change in MaterialState.scrolledUnder
        });
      }
    }
  }

  Color _resolveColor(Set<MaterialState> states, Color? widgetColor,
      Color? themeColor, Color defaultColor) {
    return MaterialStateProperty.resolveAs<Color?>(widgetColor, states) ??
        MaterialStateProperty.resolveAs<Color?>(themeColor, states) ??
        MaterialStateProperty.resolveAs<Color>(defaultColor, states);
  }

  SystemUiOverlayStyle _systemOverlayStyleForBrightness(Brightness brightness,
      [Color? backgroundColor]) {
    final SystemUiOverlayStyle style = brightness == Brightness.dark
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark;
    // For backward compatibility, create an overlay style without system navigation bar settings.
    return SystemUiOverlayStyle(
      statusBarColor: backgroundColor,
      statusBarBrightness: style.statusBarBrightness,
      statusBarIconBrightness: style.statusBarIconBrightness,
      systemStatusBarContrastEnforced: style.systemStatusBarContrastEnforced,
    );
  }

  @override
  Widget build(BuildContext context) {
    assert(!widget.primary || debugCheckHasMediaQuery(context));
    assert(debugCheckHasMaterialLocalizations(context));
    final ThemeData theme = Theme.of(context);
    final AppBarTheme appBarTheme = AppBarTheme.of(context);
    final AppBarTheme defaults = theme.useMaterial3
        ? _AppBarDefaultsM3(context)
        : _AppBarDefaultsM2(context);
    final ScaffoldState? scaffold = Scaffold.maybeOf(context);
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);

    final FlexibleSpaceBarSettings? settings =
        context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
    final Set<MaterialState> states = <MaterialState>{
      if (settings?.isScrolledUnder ?? _scrolledUnder)
        MaterialState.scrolledUnder,
    };

    final bool hasDrawer = scaffold?.hasDrawer ?? false;
    final bool hasEndDrawer = scaffold?.hasEndDrawer ?? false;
    final bool canPop = parentRoute?.canPop ?? false;
    final bool useCloseButton =
        parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;

    final double toolbarHeight =
        widget.toolbarHeight ?? appBarTheme.toolbarHeight ?? kToolbarHeight;
    final bool backwardsCompatibility = widget.backwardsCompatibility ??
        appBarTheme.backwardsCompatibility ??
        false;

    final Color backgroundColor = backwardsCompatibility
        ? widget.backgroundColor ??
            appBarTheme.backgroundColor ??
            theme.primaryColor
        : _resolveColor(
            states,
            widget.backgroundColor,
            appBarTheme.backgroundColor,
            defaults.backgroundColor!,
          );

    final Color foregroundColor = widget.foregroundColor ??
        appBarTheme.foregroundColor ??
        defaults.foregroundColor!;

    final double elevation =
        widget.elevation ?? appBarTheme.elevation ?? defaults.elevation!;

    final double effectiveElevation =
        states.contains(MaterialState.scrolledUnder)
            ? widget.scrolledUnderElevation ??
                appBarTheme.scrolledUnderElevation ??
                defaults.scrolledUnderElevation ??
                elevation
            : elevation;

    IconThemeData overallIconTheme = backwardsCompatibility
        ? widget.iconTheme ?? appBarTheme.iconTheme ?? theme.primaryIconTheme
        : widget.iconTheme ??
            appBarTheme.iconTheme ??
            defaults.iconTheme!.copyWith(color: foregroundColor);

    final Color? actionForegroundColor =
        widget.foregroundColor ?? appBarTheme.foregroundColor;
    IconThemeData actionsIconTheme = widget.actionsIconTheme ??
        appBarTheme.actionsIconTheme ??
        widget.iconTheme ??
        appBarTheme.iconTheme ??
        defaults.actionsIconTheme?.copyWith(color: actionForegroundColor) ??
        overallIconTheme;

    TextStyle? toolbarTextStyle = backwardsCompatibility
        ? widget.textTheme?.bodyMedium ??
            appBarTheme.textTheme?.bodyMedium ??
            theme.primaryTextTheme.bodyMedium
        : widget.toolbarTextStyle ??
            appBarTheme.toolbarTextStyle ??
            defaults.toolbarTextStyle?.copyWith(color: foregroundColor);

    TextStyle? titleTextStyle = backwardsCompatibility
        ? widget.textTheme?.titleLarge ??
            appBarTheme.textTheme?.titleLarge ??
            theme.primaryTextTheme.titleLarge
        : widget.titleTextStyle ??
            appBarTheme.titleTextStyle ??
            defaults.titleTextStyle?.copyWith(color: foregroundColor);

    if (widget.toolbarOpacity != 1.0) {
      final double opacity =
          const Interval(0.25, 1.0, curve: Curves.fastOutSlowIn)
              .transform(widget.toolbarOpacity);
      if (titleTextStyle?.color != null) {
        titleTextStyle = titleTextStyle!
            .copyWith(color: titleTextStyle.color!.withOpacity(opacity));
      }
      if (toolbarTextStyle?.color != null) {
        toolbarTextStyle = toolbarTextStyle!
            .copyWith(color: toolbarTextStyle.color!.withOpacity(opacity));
      }
      overallIconTheme = overallIconTheme.copyWith(
        opacity: opacity * (overallIconTheme.opacity ?? 1.0),
      );
      actionsIconTheme = actionsIconTheme.copyWith(
        opacity: opacity * (actionsIconTheme.opacity ?? 1.0),
      );
    }

    Widget? leading = widget.leading;
    if (leading == null && widget.automaticallyImplyLeading) {
      if (hasDrawer) {
        leading = IconButton(
          icon: const Icon(Icons.menu),
          iconSize: overallIconTheme.size ?? 24,
          onPressed: _handleDrawerButton,
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        );
        // TODO(chunhtai): remove (!hasEndDrawer && canPop) once internal tests
        // are migrated.
        // https://github.com/flutter/flutter/issues/80256.
      } else if ((!hasEndDrawer && canPop) ||
          (parentRoute?.impliesAppBarDismissal ?? false)) {
        leading = useCloseButton ? const CloseButton() : const BackButton();
      }
    }
    if (leading != null) {
      // Based on the Material Design 3 specs, the leading IconButton should have
      // a size of 48x48, and a highlight size of 40x40. Users can also put other
      // type of widgets on leading with the original config.
      if (theme.useMaterial3) {
        leading = ConstrainedBox(
          constraints: BoxConstraints.tightFor(
              width: widget.leadingWidth ?? _kLeadingWidth),
          child: leading is IconButton ? Center(child: leading) : leading,
        );
      } else {
        leading = ConstrainedBox(
          constraints: BoxConstraints.tightFor(
              width: widget.leadingWidth ?? _kLeadingWidth),
          child: leading,
        );
      }
    }

    Widget? title = widget.title;
    if (title != null) {
      bool? namesRoute;
      switch (theme.platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
        case TargetPlatform.linux:
        case TargetPlatform.windows:
          namesRoute = true;
          break;
        case TargetPlatform.iOS:
        case TargetPlatform.macOS:
          break;
      }

      title = _AppBarTitleBox(child: title);
      if (!widget.excludeHeaderSemantics) {
        title = Semantics(
          namesRoute: namesRoute,
          header: true,
          child: title,
        );
      }

      title = DefaultTextStyle(
        style: titleTextStyle!,
        softWrap: false,
        overflow: TextOverflow.ellipsis,
        child: title,
      );

      // Set maximum text scale factor to [_kMaxTitleTextScaleFactor] for the
      // title to keep the visual hierarchy the same even with larger font
      // sizes. To opt out, wrap the [title] widget in a [MediaQuery] widget
      // with [MediaQueryData.textScaleFactor] set to
      // `MediaQuery.textScaleFactorOf(context)`.
      final MediaQueryData mediaQueryData = MediaQuery.of(context);
      title = MediaQuery(
        data: mediaQueryData.copyWith(
          textScaleFactor: math.min(
            mediaQueryData.textScaleFactor,
            _kMaxTitleTextScaleFactor,
          ),
        ),
        child: title,
      );
    }

    Widget? actions;
    if (widget.actions != null && widget.actions!.isNotEmpty) {
      actions = Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: theme.useMaterial3
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.stretch,
        children: widget.actions!,
      );
    } else if (hasEndDrawer) {
      actions = IconButton(
        icon: const Icon(Icons.menu),
        iconSize: overallIconTheme.size ?? 24,
        onPressed: _handleDrawerButtonEnd,
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      );
    }

    // Allow the trailing actions to have their own theme if necessary.
    if (actions != null) {
      actions = IconTheme.merge(
        data: actionsIconTheme,
        child: actions,
      );
    }

    final Widget toolbar = NavigationToolbar(
      leading: leading,
      middle: title,
      trailing: actions,
      centerMiddle: widget._getEffectiveCenterTitle(theme),
      middleSpacing: widget.titleSpacing ??
          appBarTheme.titleSpacing ??
          NavigationToolbar.kMiddleSpacing,
    );

    // If the toolbar is allocated less than toolbarHeight make it
    // appear to scroll upwards within its shrinking container.
    Widget appBar = ClipRect(
      child: CustomSingleChildLayout(
        delegate: _ToolbarContainerLayout(toolbarHeight),
        child: IconTheme.merge(
          data: overallIconTheme,
          child: DefaultTextStyle(
            style: toolbarTextStyle!,
            child: toolbar,
          ),
        ),
      ),
    );
    if (widget.bottom != null) {
      appBar = Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: toolbarHeight),
              child: appBar,
            ),
          ),
          if (widget.bottomOpacity == 1.0)
            widget.bottom!
          else
            Opacity(
              opacity: const Interval(0.25, 1.0, curve: Curves.fastOutSlowIn)
                  .transform(widget.bottomOpacity),
              child: widget.bottom,
            ),
        ],
      );
    }

    // The padding applies to the toolbar and tabbar, not the flexible space.
    if (widget.primary) {
      appBar = SafeArea(
        bottom: false,
        child: appBar,
      );
    }

    appBar = Align(
      alignment: Alignment.topCenter,
      child: appBar,
    );

    if (widget.flexibleSpace != null) {
      appBar = Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          Semantics(
            sortKey: const OrdinalSortKey(1.0),
            explicitChildNodes: true,
            child: widget.flexibleSpace,
          ),
          Semantics(
            sortKey: const OrdinalSortKey(0.0),
            explicitChildNodes: true,
            // Creates a material widget to prevent the flexibleSpace from
            // obscuring the ink splashes produced by appBar children.
            child: Material(
              type: MaterialType.transparency,
              child: appBar,
            ),
          ),
        ],
      );
    }

    final SystemUiOverlayStyle overlayStyle = backwardsCompatibility
        ? _systemOverlayStyleForBrightness(
            widget.brightness ??
                appBarTheme.brightness ??
                ThemeData.estimateBrightnessForColor(backgroundColor),
          )
        : widget.systemOverlayStyle ??
            appBarTheme.systemOverlayStyle ??
            defaults.systemOverlayStyle ??
            _systemOverlayStyleForBrightness(
              ThemeData.estimateBrightnessForColor(backgroundColor),
              // Make the status bar transparent for M3 so the elevation overlay
              // color is picked up by the statusbar.
              theme.useMaterial3 ? const Color(0x00000000) : null,
            );

    return Semantics(
      container: true,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: overlayStyle,
        child: Material(
          color: backgroundColor,
          elevation: effectiveElevation,
          shadowColor: widget.shadowColor ??
              appBarTheme.shadowColor ??
              defaults.shadowColor,
          surfaceTintColor: widget.surfaceTintColor ??
              appBarTheme.surfaceTintColor ??
              defaults.surfaceTintColor,
          shape: widget.shape ?? appBarTheme.shape ?? defaults.shape,
          child: Semantics(
            explicitChildNodes: true,
            child: appBar,
          ),
        ),
      ),
    );
  }
}

class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight(
            (toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));

  final double? toolbarHeight;
  final double? bottomHeight;
}

class _AppBarDefaultsM3 extends AppBarTheme {
  _AppBarDefaultsM3(this.context)
      : super(
          elevation: 0.0,
          scrolledUnderElevation: 3.0,
          titleSpacing: NavigationToolbar.kMiddleSpacing,
          toolbarHeight: 64.0,
        );

  final BuildContext context;
  late final ThemeData _theme = Theme.of(context);
  late final ColorScheme _colors = _theme.colorScheme;
  late final TextTheme _textTheme = _theme.textTheme;

  @override
  Color? get backgroundColor => _colors.surface;

  @override
  Color? get foregroundColor => _colors.onSurface;

  @override
  Color? get shadowColor => Colors.transparent;

  @override
  Color? get surfaceTintColor => _colors.surfaceTint;

  @override
  IconThemeData? get iconTheme => IconThemeData(
        color: _colors.onSurface,
        size: 24.0,
      );

  @override
  IconThemeData? get actionsIconTheme => IconThemeData(
        color: _colors.onSurfaceVariant,
        size: 24.0,
      );

  @override
  TextStyle? get toolbarTextStyle => _textTheme.bodyMedium;

  @override
  TextStyle? get titleTextStyle => _textTheme.titleLarge;
}

class _AppBarDefaultsM2 extends AppBarTheme {
  _AppBarDefaultsM2(this.context)
      : super(
          elevation: 4.0,
          shadowColor: const Color(0xFF000000),
          titleSpacing: NavigationToolbar.kMiddleSpacing,
          toolbarHeight: kToolbarHeight,
        );

  final BuildContext context;
  late final ThemeData _theme = Theme.of(context);
  late final ColorScheme _colors = _theme.colorScheme;

  @override
  Color? get backgroundColor =>
      _colors.brightness == Brightness.dark ? _colors.surface : _colors.primary;

  @override
  Color? get foregroundColor => _colors.brightness == Brightness.dark
      ? _colors.onSurface
      : _colors.onPrimary;

  @override
  IconThemeData? get iconTheme => _theme.iconTheme;

  @override
  TextStyle? get toolbarTextStyle => _theme.textTheme.bodyMedium;

  @override
  TextStyle? get titleTextStyle => _theme.textTheme.titleLarge;
}

class _AppBarTitleBox extends SingleChildRenderObjectWidget {
  const _AppBarTitleBox({required Widget super.child}) : assert(child != null);

  @override
  _RenderAppBarTitleBox createRenderObject(BuildContext context) {
    return _RenderAppBarTitleBox(
      textDirection: Directionality.of(context),
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, _RenderAppBarTitleBox renderObject) {
    renderObject.textDirection = Directionality.of(context);
  }
}

class _RenderAppBarTitleBox extends RenderAligningShiftedBox {
  _RenderAppBarTitleBox({
    super.textDirection,
  }) : super(alignment: Alignment.center);

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    final BoxConstraints innerConstraints =
        constraints.copyWith(maxHeight: double.infinity);
    final Size childSize = child!.getDryLayout(innerConstraints);
    return constraints.constrain(childSize);
  }

  @override
  void performLayout() {
    final BoxConstraints innerConstraints =
        constraints.copyWith(maxHeight: double.infinity);
    child!.layout(innerConstraints, parentUsesSize: true);
    size = constraints.constrain(child!.size);
    alignChild();
  }
}

class _ToolbarContainerLayout extends SingleChildLayoutDelegate {
  const _ToolbarContainerLayout(this.toolbarHeight);

  final double toolbarHeight;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return constraints.tighten(height: toolbarHeight);
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(constraints.maxWidth, toolbarHeight);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return Offset(0.0, size.height - childSize.height);
  }

  @override
  bool shouldRelayout(_ToolbarContainerLayout oldDelegate) =>
      toolbarHeight != oldDelegate.toolbarHeight;
}
