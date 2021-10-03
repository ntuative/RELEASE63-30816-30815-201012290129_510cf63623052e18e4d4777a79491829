package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   
   public class WindowRectLimits implements IRectLimiter
   {
       
      
      private var var_441:int = -2.147483648E9;
      
      private var var_440:int = 2.147483647E9;
      
      private var var_442:int = -2.147483648E9;
      
      private var var_439:int = 2.147483647E9;
      
      private var _target:IWindow;
      
      public function WindowRectLimits(param1:IWindow)
      {
         super();
         this._target = param1;
      }
      
      public function get minWidth() : int
      {
         return this.var_441;
      }
      
      public function get maxWidth() : int
      {
         return this.var_440;
      }
      
      public function get minHeight() : int
      {
         return this.var_442;
      }
      
      public function get maxHeight() : int
      {
         return this.var_439;
      }
      
      public function set minWidth(param1:int) : void
      {
         this.var_441 = param1;
         if(this.var_441 > int.MIN_VALUE && !this._target.disposed && this._target.width < this.var_441)
         {
            this._target.width = this.var_441;
         }
      }
      
      public function set maxWidth(param1:int) : void
      {
         this.var_440 = param1;
         if(this.var_440 < int.MAX_VALUE && !this._target.disposed && this._target.width > this.var_440)
         {
            this._target.width = this.var_440;
         }
      }
      
      public function set minHeight(param1:int) : void
      {
         this.var_442 = param1;
         if(this.var_442 > int.MIN_VALUE && !this._target.disposed && this._target.height < this.var_442)
         {
            this._target.height = this.var_442;
         }
      }
      
      public function set maxHeight(param1:int) : void
      {
         this.var_439 = param1;
         if(this.var_439 < int.MAX_VALUE && !this._target.disposed && this._target.height > this.var_439)
         {
            this._target.height = this.var_439;
         }
      }
      
      public function get isEmpty() : Boolean
      {
         return this.var_441 == int.MIN_VALUE && this.var_440 == int.MAX_VALUE && this.var_442 == int.MIN_VALUE && this.var_439 == int.MAX_VALUE;
      }
      
      public function setEmpty() : void
      {
         this.var_441 = int.MIN_VALUE;
         this.var_440 = int.MAX_VALUE;
         this.var_442 = int.MIN_VALUE;
         this.var_439 = int.MAX_VALUE;
      }
      
      public function clone(param1:IWindow) : WindowRectLimits
      {
         var _loc2_:WindowRectLimits = new WindowRectLimits(param1);
         _loc2_.var_441 = this.var_441;
         _loc2_.var_440 = this.var_440;
         _loc2_.var_442 = this.var_442;
         _loc2_.var_439 = this.var_439;
         return _loc2_;
      }
   }
}
