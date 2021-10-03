package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureHabboWheelVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_849:int = 10;
      
      private static const const_553:int = 20;
      
      private static const const_1178:int = 31;
      
      private static const ANIMATION_ID_ROLL:int = 32;
       
      
      private var var_271:Array;
      
      private var var_661:Boolean = false;
      
      public function FurnitureHabboWheelVisualization()
      {
         this.var_271 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            if(!this.var_661)
            {
               this.var_661 = true;
               this.var_271 = new Array();
               this.var_271.push(const_1178);
               this.var_271.push(ANIMATION_ID_ROLL);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_849)
         {
            if(this.var_661)
            {
               this.var_661 = false;
               this.var_271 = new Array();
               this.var_271.push(const_849 + param1);
               this.var_271.push(const_553 + param1);
               this.var_271.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(super.getLastFramePlayed(1) && super.getLastFramePlayed(2) && super.getLastFramePlayed(3))
         {
            if(this.var_271.length > 0)
            {
               super.setAnimation(this.var_271.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
