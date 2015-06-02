for i in $(cat debian-cgi | sed 's/#//g' | cut -d = -f 1); do
echo "<% if @${i} -%>
${i}=<%= @${i} %>
<% end -%>"
done
