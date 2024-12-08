/*
 * package co.kh.dev.login;
 * 
 * import java.io.IOException; import java.io.UnsupportedEncodingException;
 * 
 * import javax.servlet.ServletException; import
 * javax.servlet.annotation.WebServlet; import javax.servlet.http.HttpServlet;
 * import javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpServletResponse; import
 * javax.servlet.http.HttpSession;
 * 
 * @WebServlet("/loginCheck.do") public class LoginCheckServlet extends
 * HttpServlet { private static final long serialVersionUID = 1L; protected void
 * processRequest(HttpServletRequest request, HttpServletResponse response) {
 * try { //1. 사용자 정보를 읽는다 request.setCharacterEncoding("UTF-8"); String id =
 * request.getParameter("id"); String pass = request.getParameter("pass");
 * 
 * //2. 데이타베이스에서 확인한다. id, pass
 * 
 * //3. 체크확인 로그인이 인정이 되면 세션을 만들어서 저장한다. if(id.equals("admin") &&
 * pass.equals("123456")) { //세션이 있으면 가져오고, 없으면 세션을 생성한다. HttpSession session =
 * request.getSession(); session.setAttribute("id", id);
 * session.setAttribute("pass", pass); }
 * response.sendRedirect("/jspStudy/loginServlet.do"); } catch
 * (UnsupportedEncodingException e) { e.printStackTrace(); } catch (IOException
 * e) { e.printStackTrace(); } } protected void doGet(HttpServletRequest
 * request, HttpServletResponse response) throws ServletException, IOException {
 * processRequest(request, response); } protected void doPost(HttpServletRequest
 * request, HttpServletResponse response) throws ServletException, IOException {
 * processRequest(request, response); } }
 */