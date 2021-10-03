package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_718;
         param1["bitmap"] = const_716;
         param1["border"] = const_657;
         param1["border_notify"] = const_1257;
         param1["button"] = const_510;
         param1["button_thick"] = const_775;
         param1["button_icon"] = const_1310;
         param1["button_group_left"] = const_605;
         param1["button_group_center"] = const_733;
         param1["button_group_right"] = const_585;
         param1["canvas"] = const_725;
         param1["checkbox"] = const_803;
         param1["closebutton"] = const_1067;
         param1["container"] = const_328;
         param1["container_button"] = const_756;
         param1["display_object_wrapper"] = const_781;
         param1["dropmenu"] = const_488;
         param1["dropmenu_item"] = const_529;
         param1["frame"] = const_372;
         param1["frame_notify"] = const_1386;
         param1["header"] = const_801;
         param1["html"] = const_1044;
         param1["icon"] = const_964;
         param1["itemgrid"] = const_1019;
         param1["itemgrid_horizontal"] = const_514;
         param1["itemgrid_vertical"] = const_619;
         param1["itemlist"] = const_1086;
         param1["itemlist_horizontal"] = const_364;
         param1["itemlist_vertical"] = const_316;
         param1["maximizebox"] = const_1397;
         param1["menu"] = const_1284;
         param1["menu_item"] = const_1322;
         param1["submenu"] = const_1003;
         param1["minimizebox"] = const_1480;
         param1["notify"] = const_1355;
         param1["null"] = const_679;
         param1["password"] = const_620;
         param1["radiobutton"] = const_590;
         param1["region"] = const_564;
         param1["restorebox"] = const_1519;
         param1["scaler"] = const_681;
         param1["scaler_horizontal"] = const_1263;
         param1["scaler_vertical"] = const_1392;
         param1["scrollbar_horizontal"] = const_532;
         param1["scrollbar_vertical"] = const_658;
         param1["scrollbar_slider_button_up"] = const_911;
         param1["scrollbar_slider_button_down"] = const_995;
         param1["scrollbar_slider_button_left"] = const_1116;
         param1["scrollbar_slider_button_right"] = const_1111;
         param1["scrollbar_slider_bar_horizontal"] = const_994;
         param1["scrollbar_slider_bar_vertical"] = const_1105;
         param1["scrollbar_slider_track_horizontal"] = const_897;
         param1["scrollbar_slider_track_vertical"] = const_980;
         param1["scrollable_itemlist"] = const_1478;
         param1["scrollable_itemlist_vertical"] = const_507;
         param1["scrollable_itemlist_horizontal"] = const_938;
         param1["selector"] = const_689;
         param1["selector_list"] = const_817;
         param1["submenu"] = const_1003;
         param1["tab_button"] = const_606;
         param1["tab_container_button"] = const_895;
         param1["tab_context"] = const_351;
         param1["tab_content"] = const_1034;
         param1["tab_selector"] = const_567;
         param1["text"] = const_664;
         param1["input"] = const_683;
         param1["toolbar"] = const_1363;
         param1["tooltip"] = const_336;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
