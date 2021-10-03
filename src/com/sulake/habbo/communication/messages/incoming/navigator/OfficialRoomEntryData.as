package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1069:int = 1;
      
      public static const const_582:int = 2;
      
      public static const const_669:int = 3;
      
      public static const const_1332:int = 4;
       
      
      private var _index:int;
      
      private var var_2232:String;
      
      private var var_2235:String;
      
      private var var_2231:Boolean;
      
      private var var_2233:String;
      
      private var var_827:String;
      
      private var var_2234:int;
      
      private var var_2061:int;
      
      private var _type:int;
      
      private var var_2010:String;
      
      private var var_850:GuestRoomData;
      
      private var var_851:PublicRoomData;
      
      private var _open:Boolean;
      
      private var _disposed:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         this._index = param1.readInteger();
         this.var_2232 = param1.readString();
         this.var_2235 = param1.readString();
         this.var_2231 = param1.readInteger() == 1;
         this.var_2233 = param1.readString();
         this.var_827 = param1.readString();
         this.var_2234 = param1.readInteger();
         this.var_2061 = param1.readInteger();
         this._type = param1.readInteger();
         if(this._type == const_1069)
         {
            this.var_2010 = param1.readString();
         }
         else if(this._type == const_669)
         {
            this.var_851 = new PublicRoomData(param1);
         }
         else if(this._type == const_582)
         {
            this.var_850 = new GuestRoomData(param1);
         }
         else
         {
            this._open = param1.readBoolean();
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_850 != null)
         {
            this.var_850.dispose();
            this.var_850 = null;
         }
         if(this.var_851 != null)
         {
            this.var_851.dispose();
            this.var_851 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get popupCaption() : String
      {
         return this.var_2232;
      }
      
      public function get popupDesc() : String
      {
         return this.var_2235;
      }
      
      public function get showDetails() : Boolean
      {
         return this.var_2231;
      }
      
      public function get picText() : String
      {
         return this.var_2233;
      }
      
      public function get picRef() : String
      {
         return this.var_827;
      }
      
      public function get folderId() : int
      {
         return this.var_2234;
      }
      
      public function get tag() : String
      {
         return this.var_2010;
      }
      
      public function get userCount() : int
      {
         return this.var_2061;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return this.var_850;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return this.var_851;
      }
      
      public function get open() : Boolean
      {
         return this._open;
      }
      
      public function toggleOpen() : void
      {
         this._open = !this._open;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_1069)
         {
            return 0;
         }
         if(this.type == const_582)
         {
            return this.var_850.maxUserCount;
         }
         if(this.type == const_669)
         {
            return this.var_851.maxUsers;
         }
         return 0;
      }
   }
}
