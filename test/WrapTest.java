import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class WrapTest {
  @Test
  public void testWrap() throws Exception {
    assertEquals("Four", wrap("Four", 7));
  }

  private String wrap(String s, int w) {
    return null;
  }
}
