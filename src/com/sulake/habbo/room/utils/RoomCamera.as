package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_877:int = 3;
       
      
      private var var_2516:int = -1;
      
      private var var_2507:int = -2;
      
      private var var_341:Vector3d = null;
      
      private var var_400:Vector3d = null;
      
      private var var_2511:Boolean = false;
      
      private var var_2515:Boolean = false;
      
      private var var_2513:Boolean = false;
      
      private var var_2512:Boolean = false;
      
      private var var_2514:int = 0;
      
      private var var_2509:int = 0;
      
      private var var_2510:int = 0;
      
      private var var_2508:int = 0;
      
      private var var_1394:int = 0;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get location() : IVector3d
      {
         return this.var_400;
      }
      
      public function get targetId() : int
      {
         return this.var_2516;
      }
      
      public function get targetCategory() : int
      {
         return this.var_2507;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return this.var_2511;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return this.var_2515;
      }
      
      public function get centeredLocX() : Boolean
      {
         return this.var_2513;
      }
      
      public function get centeredLocY() : Boolean
      {
         return this.var_2512;
      }
      
      public function get screenWd() : int
      {
         return this.var_2514;
      }
      
      public function get screenHt() : int
      {
         return this.var_2509;
      }
      
      public function get roomWd() : int
      {
         return this.var_2510;
      }
      
      public function get roomHt() : int
      {
         return this.var_2508;
      }
      
      public function set targetId(param1:int) : void
      {
         this.var_2516 = param1;
      }
      
      public function set targetCategory(param1:int) : void
      {
         this.var_2507 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         this.var_2511 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         this.var_2515 = param1;
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         this.var_2513 = param1;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         this.var_2512 = param1;
      }
      
      public function set screenWd(param1:int) : void
      {
         this.var_2514 = param1;
      }
      
      public function set screenHt(param1:int) : void
      {
         this.var_2509 = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         this.var_2510 = param1;
      }
      
      public function set roomHt(param1:int) : void
      {
         this.var_2508 = param1;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(this.var_341 == null)
         {
            this.var_341 = new Vector3d();
         }
         if(this.var_341.x != param1.x || this.var_341.y != param1.y || this.var_341.z != param1.z)
         {
            this.var_341.assign(param1);
            this.var_1394 = 0;
         }
      }
      
      public function dispose() : void
      {
         this.var_341 = null;
         this.var_400 = null;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(this.var_400 != null)
         {
            return;
         }
         this.var_400 = new Vector3d();
         this.var_400.assign(param1);
      }
      
      public function update(param1:uint, param2:Number, param3:Number) : void
      {
         var _loc4_:* = null;
         if(this.var_341 != null && this.var_400 != null)
         {
            ++this.var_1394;
            _loc4_ = Vector3d.dif(this.var_341,this.var_400);
            if(_loc4_.length <= param2)
            {
               this.var_400 = this.var_341;
               this.var_341 = null;
            }
            else
            {
               _loc4_.div(_loc4_.length);
               if(_loc4_.length < param2 * (const_877 + 1))
               {
                  _loc4_.mul(param2);
               }
               else if(this.var_1394 <= const_877)
               {
                  _loc4_.mul(param2);
               }
               else
               {
                  _loc4_.mul(param3);
               }
               this.var_400 = Vector3d.sum(this.var_400,_loc4_);
            }
         }
      }
   }
}
