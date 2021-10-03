package com.sulake.core.window.utils.tablet
{
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.MouseEventProcessor;
   
   public class TabletEventProcessor extends MouseEventProcessor
   {
       
      
      private var var_2722:String = "";
      
      public function TabletEventProcessor()
      {
         super();
      }
      
      override public function process(param1:EventProcessorState, param2:IEventQueue) : void
      {
         var_131 = param1.desktop;
         var_78 = param1.var_1168 as WindowController;
         _lastClickTarget = param1.var_1166 as WindowController;
         var_143 = param1.renderer;
         var_771 = param1.var_1169;
         param2.begin();
         param2.end();
         param1.desktop = var_131;
         param1.var_1168 = var_78;
         param1.var_1166 = _lastClickTarget;
         param1.renderer = var_143;
         param1.var_1169 = var_771;
      }
   }
}
