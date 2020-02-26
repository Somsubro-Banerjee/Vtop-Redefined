define(['dart_sdk', 'packages/flutter/src/widgets/actions', 'packages/flutter/material', 'packages/vtop/UI/homePage'], function(dart_sdk, packages__flutter__src__widgets__actions, packages__flutter__material, packages__vtop__UI__homePage) {
  'use strict';
  const core = dart_sdk.core;
  const dart = dart_sdk.dart;
  const dartx = dart_sdk.dartx;
  const binding = packages__flutter__src__widgets__actions.src__widgets__binding;
  const widget_inspector = packages__flutter__src__widgets__actions.src__widgets__widget_inspector;
  const app = packages__flutter__material.src__material__app;
  const homePage = packages__vtop__UI__homePage.UI__homePage;
  var main = Object.create(dart.library);
  const CT = Object.create(null);
  dart.defineLazy(CT, {
    get C1() {
      return C1 = dart.constList([], widget_inspector._Location);
    },
    get C0() {
      return C0 = dart.const({
        __proto__: widget_inspector._Location.prototype,
        [_Location_parameterLocations]: C1 || CT.C1,
        [_Location_name]: null,
        [_Location_column]: 13,
        [_Location_line]: 8,
        [_Location_file]: "org-dartlang-app:///packages/vtop/main.dart"
      });
    },
    get C4() {
      return C4 = dart.const({
        __proto__: widget_inspector._Location.prototype,
        [_Location_parameterLocations]: null,
        [_Location_name]: "home",
        [_Location_column]: 7,
        [_Location_line]: 8,
        [_Location_file]: null
      });
    },
    get C5() {
      return C5 = dart.const({
        __proto__: widget_inspector._Location.prototype,
        [_Location_parameterLocations]: null,
        [_Location_name]: "debugShowCheckedModeBanner",
        [_Location_column]: 7,
        [_Location_line]: 9,
        [_Location_file]: null
      });
    },
    get C3() {
      return C3 = dart.constList([C4 || CT.C4, C5 || CT.C5], widget_inspector._Location);
    },
    get C2() {
      return C2 = dart.const({
        __proto__: widget_inspector._Location.prototype,
        [_Location_parameterLocations]: C3 || CT.C3,
        [_Location_name]: null,
        [_Location_column]: 5,
        [_Location_line]: 7,
        [_Location_file]: "org-dartlang-app:///packages/vtop/main.dart"
      });
    }
  });
  var C1;
  var _Location_parameterLocations = dart.privateName(widget_inspector, "_Location.parameterLocations");
  var _Location_name = dart.privateName(widget_inspector, "_Location.name");
  var _Location_column = dart.privateName(widget_inspector, "_Location.column");
  var _Location_line = dart.privateName(widget_inspector, "_Location.line");
  var _Location_file = dart.privateName(widget_inspector, "_Location.file");
  var C0;
  var C4;
  var C5;
  var C3;
  var C2;
  main.main = function main$() {
    binding.runApp(new app.MaterialApp.new({home: new homePage.HomePage.new({$creationLocationd_0dea112b090073317d4: C0 || CT.C0}), debugShowCheckedModeBanner: false, $creationLocationd_0dea112b090073317d4: C2 || CT.C2}));
  };
  dart.trackLibraries("packages/vtop/main", {
    "package:vtop/main.dart": main
  }, {
  }, '{"version":3,"sourceRoot":"","sources":["main.dart"],"names":[],"mappings":";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;AAiBG,IAZD,eACE,+BACQ,8GACsB;EAUlC","file":"main.ddc.js"}');
  // Exports:
  return {
    main: main
  };
});

//# sourceMappingURL=main.ddc.js.map
