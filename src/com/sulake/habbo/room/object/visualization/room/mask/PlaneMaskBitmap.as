package com.sulake.habbo.room.object.visualization.room.mask
{
   import com.sulake.room.object.visualization.utils.IGraphicAsset;
   
   public class PlaneMaskBitmap
   {
      
      public static const const_51:Number = -1;
      
      public static const MAX_NORMAL_COORDINATE_VALUE:Number = 1;
       
      
      private var var_403:IGraphicAsset = null;
      
      private var var_2038:Number = -1.0;
      
      private var _normalMaxX:Number = 1.0;
      
      private var var_2039:Number = -1.0;
      
      private var var_2037:Number = 1.0;
      
      public function PlaneMaskBitmap(param1:IGraphicAsset, param2:Number = -1.0, param3:Number = 1.0, param4:Number = -1.0, param5:Number = 1.0)
      {
         super();
         this.var_2038 = param2;
         this._normalMaxX = param3;
         this.var_2039 = param4;
         this.var_2037 = param5;
         this.var_403 = param1;
      }
      
      public function get asset() : IGraphicAsset
      {
         return this.var_403;
      }
      
      public function get normalMinX() : Number
      {
         return this.var_2038;
      }
      
      public function get normalMaxX() : Number
      {
         return this._normalMaxX;
      }
      
      public function get normalMinY() : Number
      {
         return this.var_2039;
      }
      
      public function get normalMaxY() : Number
      {
         return this.var_2037;
      }
      
      public function dispose() : void
      {
         this.var_403 = null;
      }
   }
}
