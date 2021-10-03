package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_910:BigInteger;
      
      private var var_2251:BigInteger;
      
      private var var_1737:BigInteger;
      
      private var include:BigInteger;
      
      private var var_1364:BigInteger;
      
      private var var_1738:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         this.var_1364 = param1;
         this.var_1738 = param2;
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + this.var_1364.toString() + ",generator: " + this.var_1738.toString() + ",secret: " + param1);
         this.var_910 = new BigInteger();
         this.var_910.fromRadix(param1,param2);
         this.var_2251 = this.var_1738.modPow(this.var_910,this.var_1364);
         return true;
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         this.var_1737 = new BigInteger();
         this.var_1737.fromRadix(param1,param2);
         this.include = this.var_1737.modPow(this.var_910,this.var_1364);
         return this.getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return this.var_2251.toRadix(param1);
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return this.include.toRadix(param1);
      }
   }
}
