package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1626:IID;
      
      private var var_641:Boolean;
      
      private var var_1049:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         this.var_1626 = param1;
         this.var_1049 = new Array();
         this.var_641 = false;
      }
      
      public function get identifier() : IID
      {
         return this.var_1626;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_641;
      }
      
      public function get receivers() : Array
      {
         return this.var_1049;
      }
      
      public function dispose() : void
      {
         if(!this.var_641)
         {
            this.var_641 = true;
            this.var_1626 = null;
            while(this.var_1049.length > 0)
            {
               this.var_1049.pop();
            }
            this.var_1049 = null;
         }
      }
   }
}
