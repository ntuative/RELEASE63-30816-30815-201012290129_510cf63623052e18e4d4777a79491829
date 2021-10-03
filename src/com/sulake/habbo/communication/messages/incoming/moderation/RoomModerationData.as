package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_315:int;
      
      private var var_2061:int;
      
      private var var_2350:Boolean;
      
      private var var_1974:int;
      
      private var _ownerName:String;
      
      private var var_105:RoomData;
      
      private var var_746:RoomData;
      
      private var _disposed:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         this.var_315 = param1.readInteger();
         this.var_2061 = param1.readInteger();
         this.var_2350 = param1.readBoolean();
         this.var_1974 = param1.readInteger();
         this._ownerName = param1.readString();
         this.var_105 = new RoomData(param1);
         this.var_746 = new RoomData(param1);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_105 != null)
         {
            this.var_105.dispose();
            this.var_105 = null;
         }
         if(this.var_746 != null)
         {
            this.var_746.dispose();
            this.var_746 = null;
         }
      }
      
      public function get flatId() : int
      {
         return this.var_315;
      }
      
      public function get userCount() : int
      {
         return this.var_2061;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return this.var_2350;
      }
      
      public function get ownerId() : int
      {
         return this.var_1974;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get room() : RoomData
      {
         return this.var_105;
      }
      
      public function get event() : RoomData
      {
         return this.var_746;
      }
   }
}
