package com.sulake.habbo.room.object.visualization.room
{
   public class RoomPlaneRectangleMask
   {
       
      
      private var var_2191:Number = 0.0;
      
      private var var_2190:Number = 0.0;
      
      private var var_2482:Number = 0.0;
      
      private var var_2483:Number = 0.0;
      
      public function RoomPlaneRectangleMask(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.var_2191 = param1;
         this.var_2190 = param2;
         this.var_2482 = param3;
         this.var_2483 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return this.var_2191;
      }
      
      public function get rightSideLoc() : Number
      {
         return this.var_2190;
      }
      
      public function get leftSideLength() : Number
      {
         return this.var_2482;
      }
      
      public function get rightSideLength() : Number
      {
         return this.var_2483;
      }
   }
}
