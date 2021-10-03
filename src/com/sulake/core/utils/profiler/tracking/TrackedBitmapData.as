package com.sulake.core.utils.profiler.tracking
{
   import flash.display.BitmapData;
   
   public class TrackedBitmapData extends BitmapData
   {
      
      private static var var_451:uint = 0;
      
      private static var var_452:uint = 0;
      
      private static const const_1556:uint = 16777215;
       
      
      private var var_378:Object;
      
      private var _disposed:Boolean = false;
      
      public function TrackedBitmapData(param1:*, param2:int, param3:int, param4:Boolean = true, param5:uint = 4.294967295E9)
      {
         super(param2,param3,param4,param5);
         ++var_451;
         var_452 += param2 * param3 * 4;
         this.var_378 = param1;
      }
      
      public static function get numInstances() : uint
      {
         return var_451;
      }
      
      public static function get allocatedByteCount() : uint
      {
         return var_452;
      }
      
      override public function dispose() : void
      {
         if(!this._disposed)
         {
            var_452 -= width * height * 4;
            --var_451;
            super.dispose();
            this._disposed = true;
            this.var_378 = null;
         }
      }
   }
}
