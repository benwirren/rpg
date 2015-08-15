xquery version "3.0";

module namespace app="http://localhost:8080/exist/apps/rpg/templates";

import module namespace templates="http://exist-db.org/xquery/templates" ;
import module namespace config="http://localhost:8080/exist/apps/rpg/config" at "config.xqm";

(:~
 : This is a sample templating function. It will be called by the templating module if
 : it encounters an HTML element with a class attribute: class="app:test". The function
 : has to take exactly 3 parameters.
 : 
 : @param $node the HTML node with the class attribute which triggered this call
 : @param $model a map containing arbitrary data - used to pass information between template calls
 :)
declare function app:test($node as node(), $model as map(*)) {
    <p>Dummy template output generated by function app:test at {current-dateTime()}. The templating
        function was triggered by the class attribute <code>class="app:test"</code>.</p>
};


(:
 : Test Functions
 :)
declare function app:getComments($node as node(), $model as map(*)) {
    for $comment in collection($config:data-root)//comment
        return <p class="well well-small">{$comment/text()}</p>
};

declare function app:listCatechisms($node as node(), $model as map(*)) {
    for $catechism in collection($config:data-root)//catechism
        let $header := $catechism/coerp_header
        return $header/title/text()
            
};