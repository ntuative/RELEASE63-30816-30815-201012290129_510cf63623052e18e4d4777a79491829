package com.sulake.habbo.window
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IIDProfiler;
   import com.sulake.core.runtime.IProfiler;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.core.utils.Map;
   import com.sulake.core.utils.profiler.ProfilerAgentTask;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContext;
   import com.sulake.core.window.IWindowContextStateListener;
   import com.sulake.core.window.IWindowFactory;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.components.HTMLTextController;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.enum.MouseCursorType;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.graphics.ISkinContainer;
   import com.sulake.core.window.graphics.IWindowRenderer;
   import com.sulake.core.window.graphics.SkinContainer;
   import com.sulake.core.window.graphics.WindowRenderer;
   import com.sulake.core.window.tools.ProfilerOutput;
   import com.sulake.core.window.utils.DefaultAttStruct;
   import com.sulake.core.window.utils.INotify;
   import com.sulake.habbo.tracking.HabboErrorVariableEnum;
   import com.sulake.habbo.window.enum.HabboWindowTrackingEvent;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import com.sulake.habbo.window.utils.AlertDialog;
   import com.sulake.habbo.window.utils.AlertDialogWithLink;
   import com.sulake.habbo.window.utils.ConfirmDialog;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import com.sulake.habbo.window.utils.IAlertDialogWithLink;
   import com.sulake.habbo.window.utils.IConfirmDialog;
   import com.sulake.iid.IIDCoreLocalizationManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   
   public class HabboWindowManagerComponent extends Component implements IHabboWindowManager, ICoreWindowManager, IWindowFactory, IUpdateReceiver, IWindowContextStateListener
   {
      
      private static var _instance:IHabboWindowManager;
      
      private static const const_391:uint = 3;
      
      private static const const_1217:uint = 1;
       
      
      private var _localization:ICoreLocalizationManager;
      
      private var var_182:Array;
      
      private var var_236:IWindowContext;
      
      private var var_880:IWindowRenderer;
      
      private var _skinContainer:ISkinContainer;
      
      private var var_325:Array;
      
      private var var_1341:IEventDispatcher;
      
      private var var_1082:Boolean = false;
      
      private var var_1698:ProfilerOutput;
      
      private var var_1339:ProfilerAgentTask;
      
      private var var_1340:ProfilerAgentTask;
      
      public function HabboWindowManagerComponent(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var _loc4_:* = null;
         super(param1,param2,param3);
         lock();
         _instance = this;
         this.var_1341 = param1.events;
         this.var_325 = new Array();
         _loc4_ = new Dictionary();
         _loc4_["null"] = null;
         _loc4_["null"] = param3.getAssetByName("habbo_window_layout_frame_xml").content as XML;
         _loc4_["null"] = param3.getAssetByName("habbo_window_layout_simple_xml").content as XML;
         _loc4_["null"] = param3.getAssetByName("habbo_window_layout_frame_xml").content as XML;
         _loc4_["null"] = param3.getAssetByName("habbo_window_layout_header_xml").content as XML;
         _loc4_["null"] = null;
         _loc4_["null"] = param3.getAssetByName("habbo_window_layout_scrollbar_horizontal_xml").content as XML;
         _loc4_["null"] = null;
         _loc4_["null"] = null;
         _loc4_["null"] = param3.getAssetByName("habbo_window_layout_button_xml").content as XML;
         _loc4_["null"] = param3.getAssetByName("habbo_window_layout_button_thick_xml").content as XML;
         _loc4_["null"] = param3.getAssetByName("habbo_window_layout_button_xml").content as XML;
         _loc4_["null"] = param3.getAssetByName("habbo_window_layout_button_xml").content as XML;
         _loc4_["null"] = param3.getAssetByName("habbo_window_layout_button_xml").content as XML;
         _loc4_["null"] = null;
         _loc4_["null"] = param3.getAssetByName("habbo_window_layout_scrollbar_vertical_xml").content as XML;
         _loc4_["null"] = param3.getAssetByName("habbo_window_layout_dropmenu_xml").content as XML;
         _loc4_["null"] = param3.getAssetByName("habbo_window_layout_dropmenu_item_xml").content as XML;
         _loc4_["null"] = null;
         _loc4_["null"] = null;
         _loc4_["null"] = null;
         _loc4_["null"] = null;
         _loc4_["null"] = param3.getAssetByName("habbo_window_layout_tab_button_xml").content as XML;
         _loc4_["null"] = param3.getAssetByName("habbo_window_layout_tab_context_xml").content as XML;
         _loc4_["null"] = param3.getAssetByName("habbo_window_layout_tooltip_xml").content as XML;
         _loc4_["null"] = param3.getAssetByName("habbo_window_layout_scaler_xml").content as XML;
         _loc4_["null"] = param3.getAssetByName("habbo_window_layout_scrollable_itemlist_vertical_xml").content as XML;
         this.var_325.push(_loc4_);
         _loc4_ = new Dictionary();
         _loc4_["null"] = param3.getAssetByName("habbo_window_layout_button_black_xml").content as XML;
         _loc4_["null"] = param3.getAssetByName("habbo_window_layout_header_black_xml").content as XML;
         _loc4_["null"] = param3.getAssetByName("habbo_window_layout_button_thick_black_xml").content as XML;
         _loc4_["null"] = param3.getAssetByName("habbo_window_layout_button_black_xml").content as XML;
         _loc4_["null"] = param3.getAssetByName("habbo_window_layout_button_black_xml").content as XML;
         _loc4_["null"] = param3.getAssetByName("habbo_window_layout_button_black_xml").content as XML;
         _loc4_["null"] = param3.getAssetByName("habbo_window_layout_dropmenu_black_xml").content as XML;
         _loc4_["null"] = param3.getAssetByName("habbo_window_layout_dropmenu_item_black_xml").content as XML;
         _loc4_["null"] = param3.getAssetByName("habbo_window_layout_tab_button_black_xml").content as XML;
         this.var_325.push(_loc4_);
         _loc4_ = new Dictionary();
         _loc4_["null"] = param3.getAssetByName("habbo_window_layout_button_xml").content as XML;
         _loc4_["null"] = param3.getAssetByName("habbo_window_layout_button_thick_xml").content as XML;
         _loc4_["null"] = param3.getAssetByName("habbo_window_layout_button_xml").content as XML;
         _loc4_["null"] = param3.getAssetByName("habbo_window_layout_button_xml").content as XML;
         _loc4_["null"] = param3.getAssetByName("habbo_window_layout_button_xml").content as XML;
         _loc4_["null"] = param3.getAssetByName("habbo_window_layout_tab_button_xml").content as XML;
         this.var_325.push(_loc4_);
         _loc4_ = new Dictionary();
         _loc4_["null"] = param3.getAssetByName("tablet_window_layout_button_xml").content as XML;
         _loc4_["null"] = param3.getAssetByName("tablet_window_layout_button_thick_xml").content as XML;
         _loc4_["null"] = param3.getAssetByName("tablet_window_layout_dropmenu_xml").content as XML;
         _loc4_["null"] = param3.getAssetByName("tablet_window_layout_dropmenu_item_xml").content as XML;
         _loc4_["null"] = param3.getAssetByName("tablet_window_layout_tab_button_xml").content as XML;
         _loc4_["null"] = param3.getAssetByName("tablet_window_layout_tab_context_xml").content as XML;
         this.var_325.push(_loc4_);
         HTMLTextController.defaultLinkTarget = "habboMain";
         queueInterface(new IIDCoreLocalizationManager(),this.initialize);
      }
      
      public static function getInstance() : IHabboWindowManager
      {
         return _instance;
      }
      
      private function initialize(param1:IID, param2:IUnknown) : void
      {
         var _loc7_:* = null;
         var _loc3_:int = getTimer();
         this._localization = param2 as ICoreLocalizationManager;
         var _loc4_:IAsset = assets.getAssetByName("habbo_element_description_xml");
         this._skinContainer = new SkinContainer(_loc4_.content as XML,assets);
         this.var_880 = new WindowRenderer(this._skinContainer);
         this.var_182 = new Array(const_391);
         var _loc5_:Rectangle = new Rectangle(0,0,context.displayObjectContainer.stage.stageWidth,context.displayObjectContainer.stage.stageHeight);
         var _loc6_:int = 0;
         while(_loc6_ < const_391)
         {
            this.var_182[_loc6_] = new WindowContext("layer_" + _loc6_,this.var_880,this,this._localization,context.displayObjectContainer,_loc5_,this);
            _loc6_++;
         }
         this.var_236 = this.var_182[const_1217];
         _loc7_ = new Bitmap(assets.getAssetByName("habbo_cursor_link_png").content as BitmapData);
         this.var_236.getMouseCursor().defineCustomCursorType(MouseCursorType.const_345,_loc7_);
         _loc7_ = new Bitmap(assets.getAssetByName("habbo_cursor_drag_png").content as BitmapData);
         this.var_236.getMouseCursor().defineCustomCursorType(MouseCursorType.const_1281,_loc7_);
         unlock();
         registerUpdateReceiver(this,0);
         queueInterface(new IIDProfiler(),this.receiveProfilerInterface);
         _loc3_ = getTimer() - _loc3_;
         Logger.log("initializing window framework took " + _loc3_ + "ms");
      }
      
      private function onCrashTest(param1:WindowMouseEvent) : void
      {
         Logger.log("CRASH!");
         null.background = true;
      }
      
      private function receiveProfilerInterface(param1:IID, param2:IUnknown) : void
      {
         var _loc3_:IProfiler = param2 as IProfiler;
         if(_loc3_ != null)
         {
            if(!this.var_1698)
            {
               this.var_1698 = new ProfilerOutput(context,this,this.var_880);
            }
            this.var_1698.profiler = _loc3_;
            this.var_1339 = new ProfilerAgentTask("Update","Event processing");
            _loc3_.getProfilerAgentForReceiver(this).addSubTask(this.var_1339);
            this.var_1340 = new ProfilerAgentTask("Redraw","Window rasterizer");
            _loc3_.getProfilerAgentForReceiver(this).addSubTask(this.var_1340);
            this.var_1082 = true;
         }
      }
      
      private function receiveLoggerInterface(param1:IID, param2:IUnknown) : void
      {
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            removeUpdateReceiver(this);
            if(this.var_182)
            {
               while(this.var_182.length > 0)
               {
                  IDisposable(this.var_182.pop()).dispose();
               }
            }
            this.var_182 = null;
            if(this.var_325)
            {
               while(this.var_325.length > 0)
               {
                  this.var_325.pop();
               }
            }
            this.var_325 = null;
            if(this._localization)
            {
               this._localization.release(new IIDCoreLocalizationManager());
               this._localization = null;
            }
            if(this.var_880)
            {
               this.var_880.dispose();
               this.var_880 = null;
            }
            if(this._skinContainer)
            {
               this._skinContainer.dispose();
               this._skinContainer = null;
            }
            super.dispose();
         }
      }
      
      public function create(param1:String, param2:uint, param3:uint, param4:uint, param5:Rectangle, param6:Function = null, param7:String = "", param8:uint = 0, param9:Array = null, param10:IWindow = null, param11:Array = null) : IWindow
      {
         return this.var_236.create(param1,param7,param2,param3,param4,param5,param6,param10,param8,param11,param9);
      }
      
      public function destroy(param1:IWindow) : void
      {
         param1.destroy();
      }
      
      public function buildFromXML(param1:XML, param2:uint = 1, param3:Map = null) : IWindow
      {
         return this.getWindowContext(param2).getWindowParser().parseAndConstruct(param1,null,param3);
      }
      
      public function windowToXMLString(param1:IWindow) : String
      {
         return this.var_236.getWindowParser().windowToXMLString(param1);
      }
      
      public function getLayoutByTypeAndStyle(param1:uint, param2:uint) : XML
      {
         var _loc3_:Dictionary = this.var_325[param2] as Dictionary;
         if(_loc3_ == null)
         {
            return null;
         }
         var _loc4_:XML = _loc3_[param1] as XML;
         return _loc4_ == null ? this.var_325[0][param1] as XML : _loc4_;
      }
      
      public function getDefaultsByTypeAndStyle(param1:uint, param2:uint) : DefaultAttStruct
      {
         return this._skinContainer.getDefaultAttributesByTypeAndStyle(param1,param2);
      }
      
      public function createWindow(param1:String, param2:String = "", param3:uint = 0, param4:uint = 0, param5:uint = 0, param6:Rectangle = null, param7:Function = null, param8:uint = 0, param9:uint = 1) : IWindow
      {
         return this.var_182[param9].create(param1,param2,param3,param4,param5,param6,param7,null,param8,null,null);
      }
      
      public function removeWindow(param1:String, param2:uint = 1) : void
      {
         var _loc3_:IDesktopWindow = this.var_182[param2].getDesktopWindow();
         var _loc4_:IWindow = _loc3_.getChildByName(param1);
         if(_loc4_ != null)
         {
            _loc4_.destroy();
         }
      }
      
      public function getWindowByName(param1:String, param2:uint = 1) : IWindow
      {
         return this.var_182[param2].getDesktopWindow().getChildByName(param1);
      }
      
      public function getActiveWindow(param1:uint = 1) : IWindow
      {
         return this.var_182[param1].getDesktopWindow().getChildAt(this.var_236.getDesktopWindow().numChildren - 1);
      }
      
      public function getWindowContext(param1:uint) : IWindowContext
      {
         return this.var_182[param1];
      }
      
      public function getDesktop(param1:uint) : IDesktopWindow
      {
         var _loc2_:IWindowContext = this.var_182[param1];
         return !!_loc2_ ? _loc2_.getDesktopWindow() : null;
      }
      
      public function notify(param1:String, param2:String, param3:Function, param4:uint = 0) : INotify
      {
         var _loc5_:IAsset = assets.getAssetByName("habbo_window_alert_xml");
         if(!_loc5_)
         {
            throw new Error("Failed to initialize alert dialog; missing asset!");
         }
         var _loc6_:XML = _loc5_.content as XML;
         return new AlertDialog(this,_loc6_,param1,param2,param4,param3);
      }
      
      public function alert(param1:String, param2:String, param3:uint, param4:Function) : IAlertDialog
      {
         var _loc5_:IAsset = assets.getAssetByName("habbo_window_alert_xml");
         if(!_loc5_)
         {
            throw new Error("Failed to initialize alert dialog; missing asset!");
         }
         var _loc6_:XML = _loc5_.content as XML;
         return new AlertDialog(this,_loc6_,param1,param2,param3,param4);
      }
      
      public function alertWithLink(param1:String, param2:String, param3:String, param4:String, param5:uint, param6:Function) : IAlertDialogWithLink
      {
         var _loc7_:IAsset = assets.getAssetByName("habbo_window_alert_link_xml");
         if(!_loc7_)
         {
            throw new Error("Failed to initialize alert dialog; missing asset!");
         }
         var _loc8_:XML = _loc7_.content as XML;
         return new AlertDialogWithLink(this,_loc8_,param1,param2,param3,param4,param5,param6);
      }
      
      public function confirm(param1:String, param2:String, param3:uint, param4:Function) : IConfirmDialog
      {
         var _loc5_:IAsset = assets.getAssetByName("habbo_window_confirm_xml");
         if(!_loc5_)
         {
            throw new Error("Failed to initialize aleret dialog; missing asset!");
         }
         var _loc6_:XML = _loc5_.content as XML;
         return new ConfirmDialog(this,_loc6_,param1,param2,param3,param4);
      }
      
      public function registerLocalizationParameter(param1:String, param2:String, param3:String, param4:String = "%") : void
      {
         this._localization.registerParameter(param1,param2,param3,param4);
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:int = 0;
         if(this.var_1082)
         {
            this.var_1339.start();
         }
         if(WindowContext.var_351.length > 0)
         {
            this.var_1341.dispatchEvent(new Event(HabboWindowTrackingEvent.HABBO_WINDOW_TRACKING_EVENT_INPUT));
            _loc2_ = const_391 - 1;
            while(_loc2_ >= 0)
            {
               this.var_182[_loc2_].update(param1);
               _loc2_--;
            }
         }
         if(this.var_1082)
         {
            this.var_1339.stop();
         }
         if(this.var_1082)
         {
            this.var_1340.start();
         }
         this.var_1341.dispatchEvent(new Event(HabboWindowTrackingEvent.HABBO_WINDOW_TRACKING_EVENT_RENDER));
         _loc2_ = 0;
         while(_loc2_ < const_391)
         {
            this.var_182[_loc2_].render(param1);
            _loc2_++;
         }
         if(this.var_1082)
         {
            this.var_1340.stop();
         }
         if(WindowContext.var_351.length > 0)
         {
            WindowContext.var_351.flush();
         }
         this.var_1341.dispatchEvent(new Event(HabboWindowTrackingEvent.HABBO_WINDOW_TRACKING_EVENT_SLEEP));
      }
      
      public function mouseEventReceived(param1:String, param2:IWindow) : void
      {
         if(param2 != null)
         {
            if(param1 == MouseEvent.CLICK)
            {
               ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1349,new Date().getTime().toString());
               ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1400,param2.name + ": " + param2.toString());
            }
            else if(param1 == MouseEvent.MOUSE_UP)
            {
               ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1288,new Date().getTime().toString());
               ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1295,param2.name + ": " + param2.toString());
            }
         }
      }
   }
}
