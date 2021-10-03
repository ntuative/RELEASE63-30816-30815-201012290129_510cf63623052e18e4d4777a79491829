package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.debug.GarbageMonitor;
   import com.sulake.habbo.communication.messages.outgoing.tracking.PerformanceLogMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.getTimer;
   
   public class PerformanceTracker
   {
       
      
      private var _connection:IConnection = null;
      
      private var _configuration:IHabboConfigurationManager = null;
      
      private var var_519:int = 0;
      
      private var var_462:Number = 0;
      
      private var var_2668:Array;
      
      private var var_1279:String = "";
      
      private var var_1596:String = "";
      
      private var var_2198:String = "";
      
      private var var_2539:String = "";
      
      private var var_1804:Boolean = false;
      
      private var var_1594:GarbageMonitor = null;
      
      private var var_1282:int = 0;
      
      private var var_2196:Boolean;
      
      private var var_1593:int = 1000;
      
      private var var_1281:int = 0;
      
      private var _reportInterval:int = 60;
      
      private var var_1592:int = 0;
      
      private var var_1595:int = 10;
      
      private var var_1280:int = 0;
      
      private var var_2195:Number = 0.15;
      
      private var var_2197:Boolean = true;
      
      private var var_2199:Number = 0;
      
      public function PerformanceTracker()
      {
         this.var_2668 = [];
         super();
         this.var_1596 = Capabilities.version;
         this.var_2198 = Capabilities.os;
         this.var_1804 = Capabilities.isDebugger;
         this.var_1279 = !true ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown";
         if(this.var_1279 == null)
         {
            this.var_1279 = "unknown";
         }
         this.var_1594 = new GarbageMonitor();
         this.updateGarbageMonitor();
         this.var_1592 = getTimer();
      }
      
      public function get flashVersion() : String
      {
         return this.var_1596;
      }
      
      public function get averageUpdateInterval() : int
      {
         return this.var_462;
      }
      
      public function set slowUpdateLimit(param1:int) : void
      {
         this.var_1593 = param1;
      }
      
      public function set reportInterval(param1:int) : void
      {
         this._reportInterval = param1;
      }
      
      public function set reportLimit(param1:int) : void
      {
         this.var_1595 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         this._connection = param1;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         this._configuration = param1;
         this._reportInterval = int(this._configuration.getKey("performancetest.interval","60"));
         this.var_1593 = int(this._configuration.getKey("performancetest.slowupdatelimit","1000"));
         this.var_1595 = int(this._configuration.getKey("performancetest.reportlimit","10"));
         this.var_2195 = Number(this._configuration.getKey("performancetest.distribution.deviancelimit.percent","10"));
         this.var_2197 = Boolean(int(this._configuration.getKey("performancetest.distribution.enabled","1")));
         this.var_2196 = Boolean(this._configuration.getKey("monitor.garbage.collection","0") == "1");
      }
      
      public function dispose() : void
      {
      }
      
      private function updateGarbageMonitor() : Object
      {
         var _loc2_:* = null;
         var _loc1_:Array = this.var_1594.list;
         if(_loc1_ == null || _loc1_.length == 0)
         {
            _loc2_ = new GarbageTester("tester");
            this.var_1594.insert(_loc2_,"tester");
            return _loc2_;
         }
         return null;
      }
      
      public function update(param1:uint, param2:int) : void
      {
         var _loc4_:* = null;
         var _loc5_:Number = NaN;
         var _loc6_:Boolean = false;
         var _loc7_:Number = NaN;
         if(this.var_2196)
         {
            _loc4_ = this.updateGarbageMonitor();
            if(_loc4_ != null)
            {
               ++this.var_1282;
               Logger.log("Garbage collection");
            }
         }
         var _loc3_:Boolean = false;
         if(param1 > this.var_1593)
         {
            ++this.var_1281;
            _loc3_ = true;
         }
         else
         {
            ++this.var_519;
            if(this.var_519 <= 1)
            {
               this.var_462 = param1;
            }
            else
            {
               _loc5_ = Number(this.var_519);
               this.var_462 = this.var_462 * (_loc5_ - 1) / _loc5_ + Number(param1) / _loc5_;
            }
         }
         if(param2 - this.var_1592 > this._reportInterval * 1000 && this.var_1280 < this.var_1595)
         {
            Logger.log("*** Performance tracker: average frame rate " + 1000 / this.var_462);
            _loc6_ = true;
            if(this.var_2197 && this.var_1280 > 0)
            {
               _loc7_ = this.differenceInPercents(this.var_2199,this.var_462);
               if(_loc7_ < this.var_2195)
               {
                  _loc6_ = false;
               }
            }
            this.var_1592 = param2;
            if(_loc6_ || _loc3_)
            {
               this.var_2199 = this.var_462;
               if(this.sendReport(param2))
               {
                  ++this.var_1280;
               }
            }
         }
      }
      
      private function sendReport(param1:int) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(this._connection != null)
         {
            _loc2_ = null;
            _loc3_ = param1 / 1000;
            _loc4_ = -1;
            _loc5_ = 0;
            _loc2_ = new PerformanceLogMessageComposer(_loc3_,this.var_1279,this.var_1596,this.var_2198,this.var_2539,this.var_1804,_loc5_,_loc4_,this.var_1282,this.var_462,this.var_1281);
            this._connection.send(_loc2_);
            this.var_1282 = 0;
            this.var_462 = 0;
            this.var_519 = 0;
            this.var_1281 = 0;
            return true;
         }
         return false;
      }
      
      private function differenceInPercents(param1:Number, param2:Number) : Number
      {
         if(param1 == param2)
         {
            return 0;
         }
         var _loc3_:Number = param1;
         var _loc4_:Number = param2;
         if(param2 > param1)
         {
            _loc3_ = param2;
            _loc4_ = param1;
         }
         return 100 * (1 - _loc4_ / _loc3_);
      }
   }
}
