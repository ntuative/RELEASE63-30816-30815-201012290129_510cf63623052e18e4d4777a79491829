package com.sulake.habbo.room.utils
{
   public class RoomInstanceData
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_712:TileHeightMap = null;
      
      private var var_1083:LegacyWallGeometry = null;
      
      private var var_1084:RoomCamera = null;
      
      private var var_710:SelectedRoomObjectData = null;
      
      private var var_711:SelectedRoomObjectData = null;
      
      private var var_2340:String = null;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         super();
         this._roomId = param1;
         this._roomCategory = param2;
         this.var_1083 = new LegacyWallGeometry();
         this.var_1084 = new RoomCamera();
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return this.var_712;
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(this.var_712 != null)
         {
            this.var_712.dispose();
         }
         this.var_712 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return this.var_1083;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return this.var_1084;
      }
      
      public function get worldType() : String
      {
         return this.var_2340;
      }
      
      public function set worldType(param1:String) : void
      {
         this.var_2340 = param1;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return this.var_710;
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_710 != null)
         {
            this.var_710.dispose();
         }
         this.var_710 = param1;
      }
      
      public function get placedObject() : SelectedRoomObjectData
      {
         return this.var_711;
      }
      
      public function set placedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_711 != null)
         {
            this.var_711.dispose();
         }
         this.var_711 = param1;
      }
      
      public function dispose() : void
      {
         if(this.var_712 != null)
         {
            this.var_712.dispose();
            this.var_712 = null;
         }
         if(this.var_1083 != null)
         {
            this.var_1083.dispose();
            this.var_1083 = null;
         }
         if(this.var_1084 != null)
         {
            this.var_1084.dispose();
            this.var_1084 = null;
         }
         if(this.var_710 != null)
         {
            this.var_710.dispose();
            this.var_710 = null;
         }
         if(this.var_711 != null)
         {
            this.var_711.dispose();
            this.var_711 = null;
         }
      }
   }
}
