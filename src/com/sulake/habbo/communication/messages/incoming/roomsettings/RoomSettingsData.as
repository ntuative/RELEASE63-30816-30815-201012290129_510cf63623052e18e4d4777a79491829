package com.sulake.habbo.communication.messages.incoming.roomsettings
{
   public class RoomSettingsData
   {
      
      public static const const_440:int = 0;
      
      public static const const_184:int = 1;
      
      public static const const_114:int = 2;
      
      public static const const_746:Array = ["open","closed","password"];
       
      
      private var _roomId:int;
      
      private var _name:String;
      
      private var var_1514:String;
      
      private var var_2064:int;
      
      private var var_1345:int;
      
      private var var_2546:int;
      
      private var var_2612:int;
      
      private var var_773:Array;
      
      private var var_2545:Array;
      
      private var var_2613:int;
      
      private var var_2065:Boolean;
      
      private var var_2543:Boolean;
      
      private var var_2544:Boolean;
      
      private var var_2547:Boolean;
      
      public function RoomSettingsData()
      {
         super();
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2065;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         this.var_2065 = param1;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return this.var_2543;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         this.var_2543 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return this.var_2544;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         this.var_2544 = param1;
      }
      
      public function get hideWalls() : Boolean
      {
         return this.var_2547;
      }
      
      public function set hideWalls(param1:Boolean) : void
      {
         this.var_2547 = param1;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function set roomId(param1:int) : void
      {
         this._roomId = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get description() : String
      {
         return this.var_1514;
      }
      
      public function set description(param1:String) : void
      {
         this.var_1514 = param1;
      }
      
      public function get doorMode() : int
      {
         return this.var_2064;
      }
      
      public function set doorMode(param1:int) : void
      {
         this.var_2064 = param1;
      }
      
      public function get categoryId() : int
      {
         return this.var_1345;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1345 = param1;
      }
      
      public function get maximumVisitors() : int
      {
         return this.var_2546;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         this.var_2546 = param1;
      }
      
      public function get maximumVisitorsLimit() : int
      {
         return this.var_2612;
      }
      
      public function set maximumVisitorsLimit(param1:int) : void
      {
         this.var_2612 = param1;
      }
      
      public function get tags() : Array
      {
         return this.var_773;
      }
      
      public function set tags(param1:Array) : void
      {
         this.var_773 = param1;
      }
      
      public function get controllers() : Array
      {
         return this.var_2545;
      }
      
      public function set controllers(param1:Array) : void
      {
         this.var_2545 = param1;
      }
      
      public function get controllerCount() : int
      {
         return this.var_2613;
      }
      
      public function set controllerCount(param1:int) : void
      {
         this.var_2613 = param1;
      }
   }
}
