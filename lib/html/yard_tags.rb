# frozen_string_literal: true

module Alister
  module HTML
    class Builder
      # @!method html(value = nil, **args, &block)
      #   Creates a <html> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <html>

      # @!method body(value = nil, **args, &block)
      #   Creates a <body> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <body>

      # @!method div(value = nil, **args, &block)
      #   Creates a <div> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <div>

      # @!method span(value = nil, **args, &block)
      #   Creates a <span> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <span>

      # @!method applet(value = nil, **args, &block)
      #   Creates a <applet> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <applet>

      # @!method object(value = nil, **args, &block)
      #   Creates a <object> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <object>

      # @!method iframe(value = nil, **args, &block)
      #   Creates a <iframe> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <iframe>

      # @!method h1(value = nil, **args, &block)
      #   Creates a <h1> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <h1>

      # @!method h2(value = nil, **args, &block)
      #   Creates a <h2> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <h2>

      # @!method h3(value = nil, **args, &block)
      #   Creates a <h3> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <h3>

      # @!method h4(value = nil, **args, &block)
      #   Creates a <h4> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <h4>

      # @!method h5(value = nil, **args, &block)
      #   Creates a <h5> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <h5>

      # @!method h6(value = nil, **args, &block)
      #   Creates a <h6> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <h6>

      # @!method para(value = nil, **args, &block)
      #   Creates a <p> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <p>

      # @!method blockquote(value = nil, **args, &block)
      #   Creates a <blockquote> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <blockquote>

      # @!method pre(value = nil, **args, &block)
      #   Creates a <pre> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <pre>

      # @!method a(value = nil, **args, &block)
      #   Creates a <a> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <a>

      # @!method abbr(value = nil, **args, &block)
      #   Creates a <abbr> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <abbr>

      # @!method acronym(value = nil, **args, &block)
      #   Creates a <acronym> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <acronym>

      # @!method address(value = nil, **args, &block)
      #   Creates a <address> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <address>

      # @!method big(value = nil, **args, &block)
      #   Creates a <big> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <big>

      # @!method cite(value = nil, **args, &block)
      #   Creates a <cite> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <cite>

      # @!method code(value = nil, **args, &block)
      #   Creates a <code> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <code>

      # @!method del(value = nil, **args, &block)
      #   Creates a <del> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <del>

      # @!method dfn(value = nil, **args, &block)
      #   Creates a <dfn> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <dfn>

      # @!method em(value = nil, **args, &block)
      #   Creates a <em> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <em>

      # @!method img(value = nil, **args, &block)
      #   Creates a <img> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <img>

      # @!method ins(value = nil, **args, &block)
      #   Creates a <ins> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <ins>

      # @!method kbd(value = nil, **args, &block)
      #   Creates a <kbd> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <kbd>

      # @!method q(value = nil, **args, &block)
      #   Creates a <q> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <q>

      # @!method s(value = nil, **args, &block)
      #   Creates a <s> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <s>

      # @!method samp(value = nil, **args, &block)
      #   Creates a <samp> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <samp>

      # @!method small(value = nil, **args, &block)
      #   Creates a <small> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <small>

      # @!method strike(value = nil, **args, &block)
      #   Creates a <strike> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <strike>

      # @!method strong(value = nil, **args, &block)
      #   Creates a <strong> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <strong>

      # @!method sub(value = nil, **args, &block)
      #   Creates a <sub> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <sub>

      # @!method sup(value = nil, **args, &block)
      #   Creates a <sup> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <sup>

      # @!method tt(value = nil, **args, &block)
      #   Creates a <tt> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <tt>

      # @!method var(value = nil, **args, &block)
      #   Creates a <var> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <var>

      # @!method b(value = nil, **args, &block)
      #   Creates a <b> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <b>

      # @!method u(value = nil, **args, &block)
      #   Creates a <u> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <u>

      # @!method i(value = nil, **args, &block)
      #   Creates a <i> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <i>

      # @!method center(value = nil, **args, &block)
      #   Creates a <center> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <center>

      # @!method meta(value = nil, **args, &block)
      #   Creates a <meta> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <meta>

      # @!method dl(value = nil, **args, &block)
      #   Creates a <dl> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <dl>

      # @!method dt(value = nil, **args, &block)
      #   Creates a <dt> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <dt>

      # @!method dd(value = nil, **args, &block)
      #   Creates a <dd> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <dd>

      # @!method ol(value = nil, **args, &block)
      #   Creates a <ol> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <ol>

      # @!method ul(value = nil, **args, &block)
      #   Creates a <ul> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <ul>

      # @!method li(value = nil, **args, &block)
      #   Creates a <li> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <li>

      # @!method fieldset(value = nil, **args, &block)
      #   Creates a <fieldset> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <fieldset>

      # @!method form(value = nil, **args, &block)
      #   Creates a <form> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <form>

      # @!method label(value = nil, **args, &block)
      #   Creates a <label> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <label>

      # @!method legend(value = nil, **args, &block)
      #   Creates a <legend> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <legend>

      # @!method table(value = nil, **args, &block)
      #   Creates a <table> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <table>

      # @!method caption(value = nil, **args, &block)
      #   Creates a <caption> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <caption>

      # @!method tbody(value = nil, **args, &block)
      #   Creates a <tbody> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <tbody>

      # @!method tfoot(value = nil, **args, &block)
      #   Creates a <tfoot> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <tfoot>

      # @!method thead(value = nil, **args, &block)
      #   Creates a <thead> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <thead>

      # @!method tr(value = nil, **args, &block)
      #   Creates a <tr> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <tr>

      # @!method th(value = nil, **args, &block)
      #   Creates a <th> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <th>

      # @!method td(value = nil, **args, &block)
      #   Creates a <td> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <td>

      # @!method article(value = nil, **args, &block)
      #   Creates a <article> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <article>

      # @!method aside(value = nil, **args, &block)
      #   Creates a <aside> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <aside>

      # @!method canvas(value = nil, **args, &block)
      #   Creates a <canvas> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <canvas>

      # @!method details(value = nil, **args, &block)
      #   Creates a <details> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <details>

      # @!method embed(value = nil, **args, &block)
      #   Creates a <embed> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <embed>

      # @!method figure(value = nil, **args, &block)
      #   Creates a <figure> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <figure>

      # @!method figcaption(value = nil, **args, &block)
      #   Creates a <figcaption> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <figcaption>

      # @!method footer(value = nil, **args, &block)
      #   Creates a <footer> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <footer>

      # @!method header(value = nil, **args, &block)
      #   Creates a <header> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <header>

      # @!method hgroup(value = nil, **args, &block)
      #   Creates a <hgroup> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <hgroup>

      # @!method menu(value = nil, **args, &block)
      #   Creates a <menu> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <menu>

      # @!method nav(value = nil, **args, &block)
      #   Creates a <nav> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <nav>

      # @!method output(value = nil, **args, &block)
      #   Creates a <output> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <output>

      # @!method ruby(value = nil, **args, &block)
      #   Creates a <ruby> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <ruby>

      # @!method section(value = nil, **args, &block)
      #   Creates a <section> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <section>

      # @!method summary(value = nil, **args, &block)
      #   Creates a <summary> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <summary>

      # @!method time(value = nil, **args, &block)
      #   Creates a <time> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <time>

      # @!method mark(value = nil, **args, &block)
      #   Creates a <mark> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <mark>

      # @!method audio(value = nil, **args, &block)
      #   Creates a <audio> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <audio>

      # @!method video(value = nil, **args, &block)
      #   Creates a <video> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <video>

      # @!method script(value = nil, **args, &block)
      #   Creates a <script> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <script>

      # @!method head(value = nil, **args, &block)
      #   Creates a <head> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <head>

      # @!method title(value = nil, **args, &block)
      #   Creates a <title> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <title>

      # @!method link(value = nil, **args, &block)
      #   Creates a <link> element and puts it to {#elements}
      #   @param value [String] The value of the element
      #   @param args [Hash] The attributes of the element
      #   @return [void]
      #   @yield Create child elements of <link>
    end
  end
end
