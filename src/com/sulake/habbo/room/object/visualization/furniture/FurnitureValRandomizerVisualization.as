package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_849:int = 20;
      
      private static const const_553:int = 10;
      
      private static const const_1178:int = 31;
      
      private static const ANIMATION_ID_ROLL:int = 32;
      
      private static const ANIMATION_ID_OFF:int = 30;
       
      
      private var var_271:Array;
      
      private var var_661:Boolean = false;
      
      public function FurnitureValRandomizerVisualization()
      {
         this.var_271 = new Array();
         super();
         super.setAnimation(ANIMATION_ID_OFF);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
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
         if(param1 > 0 && param1 <= const_553)
         {
            if(this.var_661)
            {
               this.var_661 = false;
               this.var_271 = new Array();
               if(_direction == 2)
               {
                  this.var_271.push(const_849 + 5 - param1);
                  this.var_271.push(const_553 + 5 - param1);
               }
               else
               {
                  this.var_271.push(const_849 + param1);
                  this.var_271.push(const_553 + param1);
               }
               this.var_271.push(ANIMATION_ID_OFF);
               return;
            }
            super.setAnimation(ANIMATION_ID_OFF);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(super.getLastFramePlayed(11))
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
