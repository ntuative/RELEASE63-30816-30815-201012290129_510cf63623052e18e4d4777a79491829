package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureBottleVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_849:int = 20;
      
      private static const const_553:int = 9;
      
      private static const ANIMATION_ID_ROLL:int = -1;
       
      
      private var var_271:Array;
      
      private var var_661:Boolean = false;
      
      public function FurnitureBottleVisualization()
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
               this.var_271.push(ANIMATION_ID_ROLL);
               return;
            }
         }
         if(param1 >= 0 && param1 <= 7)
         {
            if(this.var_661)
            {
               this.var_661 = false;
               this.var_271 = new Array();
               this.var_271.push(const_849);
               this.var_271.push(const_553 + param1);
               this.var_271.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(super.getLastFramePlayed(0))
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
