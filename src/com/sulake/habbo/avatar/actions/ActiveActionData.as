package com.sulake.habbo.avatar.actions
{
   public class ActiveActionData implements IActiveActionData
   {
       
      
      private var var_1613:String = "";
      
      private var _actionParameter:String = "";
      
      private var var_1079:IActionDefinition;
      
      private var var_2333:int = 0;
      
      private var var_2334:String;
      
      public function ActiveActionData(param1:String, param2:String = "", param3:int = 0)
      {
         super();
         this.var_1613 = param1;
         this._actionParameter = param2;
         this.var_2333 = param3;
      }
      
      public function get actionType() : String
      {
         return this.var_1613;
      }
      
      public function get actionParameter() : String
      {
         return this._actionParameter;
      }
      
      public function get definition() : IActionDefinition
      {
         return this.var_1079;
      }
      
      public function get id() : String
      {
         if(this.var_1079 == null)
         {
            return "";
         }
         return this.var_1079.id + "_" + this._actionParameter;
      }
      
      public function set actionParameter(param1:String) : void
      {
         this._actionParameter = param1;
      }
      
      public function set definition(param1:IActionDefinition) : void
      {
         this.var_1079 = param1;
      }
      
      public function dispose() : void
      {
         this.var_1613 = null;
         this._actionParameter = null;
         this.var_1079 = null;
      }
      
      public function get startFrame() : int
      {
         return this.var_2333;
      }
      
      public function get overridingAction() : String
      {
         return this.var_2334;
      }
      
      public function set overridingAction(param1:String) : void
      {
         this.var_2334 = param1;
      }
   }
}
