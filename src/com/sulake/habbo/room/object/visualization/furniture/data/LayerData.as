package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class LayerData
   {
      
      public static const const_682:String = "";
      
      public static const const_513:int = 0;
      
      public static const const_475:int = 255;
      
      public static const const_593:Boolean = false;
      
      public static const const_503:int = 0;
      
      public static const const_536:int = 0;
      
      public static const const_515:int = 0;
      
      public static const const_985:int = 1;
      
      public static const const_933:int = 2;
      
      public static const INK_DARKEN:int = 3;
       
      
      private var var_2010:String = "";
      
      private var var_1495:int = 0;
      
      private var var_2148:int = 255;
      
      private var var_2146:Boolean = false;
      
      private var var_2147:int = 0;
      
      private var var_2145:int = 0;
      
      private var var_2144:Number = 0;
      
      public function LayerData()
      {
         super();
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2010 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2010;
      }
      
      public function set ink(param1:int) : void
      {
         this.var_1495 = param1;
      }
      
      public function get ink() : int
      {
         return this.var_1495;
      }
      
      public function set alpha(param1:int) : void
      {
         this.var_2148 = param1;
      }
      
      public function get alpha() : int
      {
         return this.var_2148;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         this.var_2146 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return this.var_2146;
      }
      
      public function set xOffset(param1:int) : void
      {
         this.var_2147 = param1;
      }
      
      public function get xOffset() : int
      {
         return this.var_2147;
      }
      
      public function set yOffset(param1:int) : void
      {
         this.var_2145 = param1;
      }
      
      public function get yOffset() : int
      {
         return this.var_2145;
      }
      
      public function set zOffset(param1:Number) : void
      {
         this.var_2144 = param1;
      }
      
      public function get zOffset() : Number
      {
         return this.var_2144;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            this.tag = param1.tag;
            this.ink = param1.ink;
            this.alpha = param1.alpha;
            this.ignoreMouse = param1.ignoreMouse;
            this.xOffset = param1.xOffset;
            this.yOffset = param1.yOffset;
            this.zOffset = param1.zOffset;
         }
      }
   }
}
