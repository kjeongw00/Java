package chap20_lambda.clazz;

public class UserCharString implements UserChar{
	public String str;

	public UserCharString(String a) {
		this.str = a;
	}
	
	public String getStr() {
		return str;
	}

	public void setStr(String str) {
		this.str = str;
	}	
	
	public void changeStr(char ch, char UserChar) {
		
	}
	
	@Override
	public String findUserChar(char ch, String str) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String toString() {
		return "UserCharString [str=" + str + "]";
	}
}
