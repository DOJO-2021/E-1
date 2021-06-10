package util;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


public class Hash{
    String hashH;
		public String getHash(String h) {
		byte[] bArray=  h.getBytes();
		try {
//			インスタンスの生成
		 MessageDigest md = MessageDigest.getInstance("MD5");
		 byte[] result = md.digest(bArray);

//		 byte型の同じ要素数を格納できるint型配列の宣言

		 int[] i = new int[result.length];

//		 文字列操作が可能なStringBufferクラスをインスタンス生成する。
		 StringBuffer sb = new StringBuffer();

//		 16進数に変換し形を整える。
//		 （バイト型をイント型にキャストし、
//		 そのままでは非signed byte値になってしまうため、0xffとの論理積をとる。）
		 for (int j=0; j < result.length; j++){
             i[j] = (int)result[j] & 0xff;
             if (i[j]<=15){
//            	 15以下ならば桁に「0」を足す。
                 sb.append("0");
             }
             sb.append(Integer.toHexString(i[j]));
         }


		  hashH = sb.toString();
        }catch(NoSuchAlgorithmException e) {
            e.printStackTrace();
        }finally{
            return hashH;
        }
    }
}