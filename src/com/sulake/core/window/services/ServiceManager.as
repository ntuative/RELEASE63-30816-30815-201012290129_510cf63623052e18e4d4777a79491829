package com.sulake.core.window.services
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class ServiceManager implements IInternalWindowServices, IDisposable
   {
       
      
      private var var_2683:uint;
      
      private var var_130:DisplayObject;
      
      private var _disposed:Boolean = false;
      
      private var var_236:IWindowContext;
      
      private var var_1111:IMouseDraggingService;
      
      private var var_1114:IMouseScalingService;
      
      private var var_1109:IMouseListenerService;
      
      private var var_1113:IFocusManagerService;
      
      private var var_1110:IToolTipAgentService;
      
      private var var_1112:IGestureAgentService;
      
      public function ServiceManager(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         this.var_2683 = 0;
         this.var_130 = param2;
         this.var_236 = param1;
         this.var_1111 = new WindowMouseDragger(param2);
         this.var_1114 = new WindowMouseScaler(param2);
         this.var_1109 = new WindowMouseListener(param2);
         this.var_1113 = new FocusManager(param2);
         this.var_1110 = new WindowToolTipAgent(param2);
         this.var_1112 = new GestureAgentService();
      }
      
      public function dispose() : void
      {
         if(this.var_1111 != null)
         {
            this.var_1111.dispose();
            this.var_1111 = null;
         }
         if(this.var_1114 != null)
         {
            this.var_1114.dispose();
            this.var_1114 = null;
         }
         if(this.var_1109 != null)
         {
            this.var_1109.dispose();
            this.var_1109 = null;
         }
         if(this.var_1113 != null)
         {
            this.var_1113.dispose();
            this.var_1113 = null;
         }
         if(this.var_1110 != null)
         {
            this.var_1110.dispose();
            this.var_1110 = null;
         }
         if(this.var_1112 != null)
         {
            this.var_1112.dispose();
            this.var_1112 = null;
         }
         this.var_130 = null;
         this.var_236 = null;
         this._disposed = true;
      }
      
      public function getMouseDraggingService() : IMouseDraggingService
      {
         return this.var_1111;
      }
      
      public function getMouseScalingService() : IMouseScalingService
      {
         return this.var_1114;
      }
      
      public function getMouseListenerService() : IMouseListenerService
      {
         return this.var_1109;
      }
      
      public function getFocusManagerService() : IFocusManagerService
      {
         return this.var_1113;
      }
      
      public function getToolTipAgentService() : IToolTipAgentService
      {
         return this.var_1110;
      }
      
      public function getGestureAgentService() : IGestureAgentService
      {
         return this.var_1112;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
   }
}
