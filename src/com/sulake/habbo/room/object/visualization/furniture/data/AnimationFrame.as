package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class AnimationFrame
   {
      
      public static const const_418:int = -1;
      
      public static const const_1055:int = -1;
       
      
      private var _id:int = 0;
      
      private var _x:int = 0;
      
      private var var_161:int = 0;
      
      private var var_2138:int = 1;
      
      private var var_822:int = 1;
      
      private var var_1552:int = 1;
      
      private var var_2140:int = -1;
      
      private var var_2139:int = 0;
      
      private var var_2137:Boolean = false;
      
      public function AnimationFrame(param1:int, param2:int, param3:int, param4:int, param5:int, param6:Boolean, param7:int = -1, param8:int = 0)
      {
         super();
         this._id = param1;
         this._x = param2;
         this.var_161 = param3;
         this.var_2137 = param6;
         if(param4 < 1)
         {
            param4 = 1;
         }
         this.var_2138 = param4;
         if(param5 < 0)
         {
            param5 = const_418;
         }
         this.var_822 = param5;
         this.var_1552 = param5;
         if(param7 >= 0)
         {
            this.var_2140 = param7;
            this.var_2139 = param8;
         }
      }
      
      public function get id() : int
      {
         if(this._id >= 0)
         {
            return this._id;
         }
         return -this._id * Math.random();
      }
      
      public function get x() : int
      {
         return this._x;
      }
      
      public function get y() : int
      {
         return this.var_161;
      }
      
      public function get repeats() : int
      {
         return this.var_2138;
      }
      
      public function get frameRepeats() : int
      {
         return this.var_822;
      }
      
      public function get isLastFrame() : Boolean
      {
         return this.var_2137;
      }
      
      public function get remainingFrameRepeats() : int
      {
         if(this.var_822 < 0)
         {
            return const_418;
         }
         return this.var_1552;
      }
      
      public function set remainingFrameRepeats(param1:int) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(this.var_822 > 0 && param1 > this.var_822)
         {
            param1 = this.var_822;
         }
         this.var_1552 = param1;
      }
      
      public function get activeSequence() : int
      {
         return this.var_2140;
      }
      
      public function get activeSequenceOffset() : int
      {
         return this.var_2139;
      }
   }
}
