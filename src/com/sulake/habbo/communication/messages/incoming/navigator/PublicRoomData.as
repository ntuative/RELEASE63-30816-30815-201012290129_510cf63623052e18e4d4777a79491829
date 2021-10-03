package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_2291:String;
      
      private var var_2149:int;
      
      private var var_2209:int;
      
      private var var_2150:String;
      
      private var var_2292:int;
      
      private var var_1661:int;
      
      private var _disposed:Boolean;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2291 = param1.readString();
         this.var_2149 = param1.readInteger();
         this.var_2209 = param1.readInteger();
         this.var_2150 = param1.readString();
         this.var_2292 = param1.readInteger();
         this.var_1661 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get unitPropertySet() : String
      {
         return this.var_2291;
      }
      
      public function get unitPort() : int
      {
         return this.var_2149;
      }
      
      public function get worldId() : int
      {
         return this.var_2209;
      }
      
      public function get castLibs() : String
      {
         return this.var_2150;
      }
      
      public function get maxUsers() : int
      {
         return this.var_2292;
      }
      
      public function get nodeId() : int
      {
         return this.var_1661;
      }
   }
}
