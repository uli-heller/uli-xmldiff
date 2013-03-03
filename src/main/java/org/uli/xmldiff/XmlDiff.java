package org.uli.xmldiff;

import java.io.File;
import java.io.FileReader;
import java.util.List;

import org.custommonkey.xmlunit.Diff;
import org.custommonkey.xmlunit.DetailedDiff;
import org.custommonkey.xmlunit.Difference;

public class XmlDiff {
    public static void main(String[] args) {
      String from = args[0];
      String to   = args[1];

      try {
	Diff diff = new Diff(new FileReader(new File(from)), new FileReader(new File(to)));
        if (!diff.similar()) {
	  DetailedDiff detailedDiff = new DetailedDiff(diff);
          int i=0;
          for (Difference d : (List<Difference>) detailedDiff.getAllDifferences()) {
	      System.err.println("Difference "+ (++i) +":"+d.getDescription());
              String srcXpath = d.getControlNodeDetail().getXpathLocation();
              String dstXpath = d.getTestNodeDetail().getXpathLocation();
              if (srcXpath == null) {
		srcXpath = "not available";
              }
              if (dstXpath == null) {
		dstXpath = "not available";
              }
              System.err.println("       src: "+srcXpath);
              System.err.println("       dst: "+dstXpath);
	  }
          System.exit(1);
        }
      } catch (Exception e) {
	  e.printStackTrace(System.err);
          System.exit(1);
      }
    }
}
