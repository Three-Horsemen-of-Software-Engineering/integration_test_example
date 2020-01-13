# [Automatic introduction](https://flutter.dev/docs/cookbook/testing/integration/introduction)

Test must include at least 2 modules, the first is testName.dart contains <br/>
initializing part that run our app from the required part. <br/>

   `import 'package:flutter_driver/driver_extension.dart';` <br/>
   `import 'package:integration_tests/main.dart' as app;` <br/>
    <br/>
   `void main() {` <br/>  
   `enableFlutterDriverExtension();` <br/>
   `app.main();`<br/>  
   }` <br/>
    The second part is exactly tests in module testName_test.dart. <br/>
     Should notify that using widget tests in this module is <br/>
    forbidden. This class must not have dart.ui dependencies. <br/>
    
   #Finders<br/>
           
   5 methods of widget finding are exists <br/>
   ///Depends on widget class, class must be single visible or method will throw exception <br/>
   `find.byType('WidgetClassName');`<br/>
   /// Depends on unique tooltip string, must be single visible with current tooltip or method will throw exception<br/>
   `find.byTooltip('TooltipString');`<br/>
   /// Depends on unique key value, must be single visible with current keyValue or method will throw exception <br/>
   `find.byKeyValue('KeyValueString');`<br/>
    ///Not discovered how exactly it works<br/>
   `find.bySemanticsLabel('SemanticsLabel');`<br/>
   ///finds text widget location by string. Works only if string is unique.<br/>
   `find.text("text)`
   
   #Driver access methods<br/>
   
   finder - widget finder of widget that should be found in scrollable widget<br/>
   scrollable - widget that will be scrolled<br/>
   dx - scroll offset for x axis<br/>
   dy - scroll offset for y axis<br/>
   duration - scroll duration<br/>
   
   Scroll<br/>
   
   `driver.scroll(scrollable,dx,dy,duration);`<br/>
   `driver.scrollUntilVisible(scrollable, item,dx,dy,duration)`<br/>
   `driver.scrollIntoView(finder,dx,dy,duration);`<br/>
   
   Other<br/>
   /// taps on widget that was found by finder.<br/>
   `driver.tap(finder)` <br/>
   /// enters text to widget that you are focused on. This method don't call<br/>
   on edition finished callbacks, so you have to manage it by yourself.<br/>
   `driver.enterText(text);`<br/>
   ///makes screenshot returns it in png format<br/>
   `driver.driver.screenshot();`<br/>