package conn;

import java.net.URI;
import java.net.URISyntaxException;

import de.roderick.weberknecht.*;


public class Connect{

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		try {
			URI url = new URI("ws://localhost:3800/");
			WebSocket websocket = new WebSocketConnection(url);
			websocket.setEventHandler(new WebSocketEventHandler() {
				public void onOpen(){
					System.out.println("--open");
				}    
				public void onMessage(WebSocketMessage message){
					System.out.println("--received message: " + message.getText());
				}   
				public void onClose(){
					System.out.println("--close");
				}
			});

			websocket.connect();
			websocket.send("{\"id\":\"mary@mmm.com\"}");
//			websocket.send("disconnect");
//			websocket.close();
		}
		catch (WebSocketException wse) {
			wse.printStackTrace();
		}
		catch (URISyntaxException use) {
			use.printStackTrace();
		}
	}

}
