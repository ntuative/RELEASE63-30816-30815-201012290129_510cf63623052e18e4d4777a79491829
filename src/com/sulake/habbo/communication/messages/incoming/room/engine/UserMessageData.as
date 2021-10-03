package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_890:String = "M";
      
      public static const const_1354:String = "F";
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_161:Number = 0;
      
      private var var_160:Number = 0;
      
      private var var_239:int = 0;
      
      private var _name:String = "";
      
      private var var_2487:int = 0;
      
      private var var_925:String = "";
      
      private var var_561:String = "";
      
      private var var_2410:String = "";
      
      private var var_1928:int;
      
      private var var_1933:int = 0;
      
      private var var_2412:String = "";
      
      private var var_2411:int = 0;
      
      private var var_1934:int = 0;
      
      private var var_2488:String = "";
      
      private var var_167:Boolean = false;
      
      public function UserMessageData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function setReadOnly() : void
      {
         this.var_167 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         if(!this.var_167)
         {
            this._x = param1;
         }
      }
      
      public function get y() : Number
      {
         return this.var_161;
      }
      
      public function set y(param1:Number) : void
      {
         if(!this.var_167)
         {
            this.var_161 = param1;
         }
      }
      
      public function get z() : Number
      {
         return this.var_160;
      }
      
      public function set z(param1:Number) : void
      {
         if(!this.var_167)
         {
            this.var_160 = param1;
         }
      }
      
      public function get dir() : int
      {
         return this.var_239;
      }
      
      public function set dir(param1:int) : void
      {
         if(!this.var_167)
         {
            this.var_239 = param1;
         }
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         if(!this.var_167)
         {
            this._name = param1;
         }
      }
      
      public function get userType() : int
      {
         return this.var_2487;
      }
      
      public function set userType(param1:int) : void
      {
         if(!this.var_167)
         {
            this.var_2487 = param1;
         }
      }
      
      public function get sex() : String
      {
         return this.var_925;
      }
      
      public function set sex(param1:String) : void
      {
         if(!this.var_167)
         {
            this.var_925 = param1;
         }
      }
      
      public function get figure() : String
      {
         return this.var_561;
      }
      
      public function set figure(param1:String) : void
      {
         if(!this.var_167)
         {
            this.var_561 = param1;
         }
      }
      
      public function get custom() : String
      {
         return this.var_2410;
      }
      
      public function set custom(param1:String) : void
      {
         if(!this.var_167)
         {
            this.var_2410 = param1;
         }
      }
      
      public function get achievementScore() : int
      {
         return this.var_1928;
      }
      
      public function set achievementScore(param1:int) : void
      {
         if(!this.var_167)
         {
            this.var_1928 = param1;
         }
      }
      
      public function get webID() : int
      {
         return this.var_1933;
      }
      
      public function set webID(param1:int) : void
      {
         if(!this.var_167)
         {
            this.var_1933 = param1;
         }
      }
      
      public function get groupID() : String
      {
         return this.var_2412;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!this.var_167)
         {
            this.var_2412 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return this.var_2411;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!this.var_167)
         {
            this.var_2411 = param1;
         }
      }
      
      public function get xp() : int
      {
         return this.var_1934;
      }
      
      public function set xp(param1:int) : void
      {
         if(!this.var_167)
         {
            this.var_1934 = param1;
         }
      }
      
      public function get subType() : String
      {
         return this.var_2488;
      }
      
      public function set subType(param1:String) : void
      {
         if(!this.var_167)
         {
            this.var_2488 = param1;
         }
      }
   }
}
