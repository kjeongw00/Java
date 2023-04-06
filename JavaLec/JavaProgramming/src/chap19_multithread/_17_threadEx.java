package chap19_multithread;

import chap19_multithread.clazz.BoardDAO;

public class _17_threadEx {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		BoardDAO boardDAO = new BoardDAO();
		
		for(int i = 0; i < 20; i++) {
			Thread t = new Thread() {
				@Override
				public void run() {
					System.out.println(
							boardDAO.selectBoardList()
					);
					
					try {
						Thread.sleep(500);
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			};
			
			t.start();
		}
		
//		Thread thread = new Thread() {
//			@Override
//			public void run() {
//				boardDAO.selectBoardList();
//			}
//		};
	}

}
