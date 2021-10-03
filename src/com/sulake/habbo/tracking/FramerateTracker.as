package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class FramerateTracker
   {
       
      
      private var var_1592:int;
      
      private var var_2442:int;
      
      private var var_1116:int;
      
      private var var_462:Number;
      
      private var var_2440:Boolean;
      
      private var var_2441:int;
      
      private var var_1749:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2442 = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         this.var_2441 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         this.var_2440 = true;
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking, param3:int) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         ++this.var_1116;
         if(this.var_1116 == 1)
         {
            this.var_462 = param1;
            this.var_1592 = param3;
         }
         else
         {
            _loc4_ = Number(this.var_1116);
            this.var_462 = this.var_462 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(this.var_2440 && param3 - this.var_1592 >= this.var_2442 && this.var_1749 < this.var_2441)
         {
            _loc5_ = 1000 / this.var_462;
            param2.track("performance","averageFramerate",Math.round(_loc5_));
            ++this.var_1749;
            this.var_1592 = param3;
            this.var_1116 = 0;
         }
      }
      
      public function dispose() : void
      {
      }
   }
}
