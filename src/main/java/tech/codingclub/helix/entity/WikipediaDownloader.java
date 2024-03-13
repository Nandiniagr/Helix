package tech.codingclub.helix.entity;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import tech.codingclub.helix.global.HttpURLConnectionExample;

public class WikipediaDownloader{



    private String keyword;


    public WikipediaDownloader()
    {

    }
    public WikipediaDownloader(String keyword) {
        this.keyword = keyword;
    }
    public WikiResult getResponse() {

        if(this.keyword==null || this.keyword.length()==0)
        {
            return null;
        }
        //1
        this.keyword= this.keyword.trim().replaceAll("[ ]","_");
        //2
        String wikiUrl = getWikipediaUrlForQuery(this.keyword);
        String response="";
        String img_url=null;

        try
        {
            //3
            String wikipediaResponseHtml= HttpURLConnectionExample.sendGet(wikiUrl);
            //System.out.println(wikipediaResponseHtml);
            //4
            Document document = Jsoup.parse(wikipediaResponseHtml,"https://en.wikipedia.org/wiki/");
            Elements childElements=document.body().select(".mw-parser-output > *");
            int state=0;
            for(Element childElement : childElements)
            {
                if(state==0)
                {
                    if(childElement.tagName().equals("table"))
                    {
                        state=1;

                    }
                }
                else if(state==1)
                {
                    if(childElement.tagName().equals("p"))
                    {
                        state=2;
                        response = childElement.text();
                        break;
                    }
                }
            }
            try
            {
                img_url=document.body().select(".infobox img").get(0).attr("src");
            }
            catch (Exception e)
            {
                e.printStackTrace();
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        if(img_url.startsWith("//"))
        {
            img_url="https:"+img_url;
        }

        WikiResult wikiResult=new WikiResult(this.keyword,response,img_url);
        return wikiResult;
    }
    private String getWikipediaUrlForQuery(String cleanKeyword)
    {
        return "https://en.wikipedia.org/wiki/" + cleanKeyword;
    }


}
