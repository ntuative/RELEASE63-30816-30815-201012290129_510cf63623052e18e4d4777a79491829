package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_170;
         param1["bound_to_parent_rect"] = const_92;
         param1["child_window"] = const_975;
         param1["embedded_controller"] = const_1075;
         param1["resize_to_accommodate_children"] = const_63;
         param1["input_event_processor"] = const_28;
         param1["internal_event_handling"] = const_717;
         param1["mouse_dragging_target"] = const_234;
         param1["mouse_dragging_trigger"] = const_324;
         param1["mouse_scaling_target"] = const_303;
         param1["mouse_scaling_trigger"] = const_482;
         param1["horizontal_mouse_scaling_trigger"] = const_243;
         param1["vertical_mouse_scaling_trigger"] = const_222;
         param1["observe_parent_input_events"] = const_1056;
         param1["optimize_region_to_layout_size"] = const_415;
         param1["parent_window"] = const_983;
         param1["relative_horizontal_scale_center"] = const_171;
         param1["relative_horizontal_scale_fixed"] = const_131;
         param1["relative_horizontal_scale_move"] = const_339;
         param1["relative_horizontal_scale_strech"] = WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_STRECH;
         param1["relative_scale_center"] = const_1074;
         param1["relative_scale_fixed"] = const_603;
         param1["relative_scale_move"] = const_1100;
         param1["relative_scale_strech"] = const_922;
         param1["relative_vertical_scale_center"] = const_187;
         param1["relative_vertical_scale_fixed"] = const_119;
         param1["relative_vertical_scale_move"] = const_366;
         param1["relative_vertical_scale_strech"] = const_377;
         param1["on_resize_align_left"] = const_665;
         param1["on_resize_align_right"] = const_534;
         param1["on_resize_align_center"] = const_434;
         param1["on_resize_align_top"] = const_674;
         param1["on_resize_align_bottom"] = const_447;
         param1["on_resize_align_middle"] = const_437;
         param1["on_accommodate_align_left"] = const_955;
         param1["on_accommodate_align_right"] = const_444;
         param1["on_accommodate_align_center"] = const_599;
         param1["on_accommodate_align_top"] = const_1068;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_581;
         param1["route_input_events_to_parent"] = const_504;
         param1["use_parent_graphic_context"] = const_32;
         param1["draggable_with_mouse"] = const_1090;
         param1["scalable_with_mouse"] = const_1077;
         param1["reflect_horizontal_resize_to_parent"] = const_465;
         param1["reflect_vertical_resize_to_parent"] = const_477;
         param1["reflect_resize_to_parent"] = const_280;
         param1["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
