/*
 * This file is part of Butter.
 *
 * Butter is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Butter is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Butter. If not, see <http://www.gnu.org/licenses/>.
 */

package butter.droid.provider.subs.opensubs.data;

import butter.droid.provider.subs.opensubs.data.model.response.LoginResponse;
import butter.droid.provider.subs.opensubs.data.model.response.SearchResponse;
import io.reactivex.Single;
import java.util.List;
import nl.nl2312.xmlrpc.XmlRpc;
import okhttp3.ResponseBody;
import retrofit2.http.Body;
import retrofit2.http.GET;
import retrofit2.http.POST;
import retrofit2.http.Url;

public interface OpenSubsService {

    @XmlRpc("LogIn") @POST("xml-rpc") Single<LoginResponse> login(@Body String[] request);

    @XmlRpc("SearchSubtitles") @POST("xml-rpc") Single<SearchResponse> search(@Body List<Object> request);

    @GET Single<ResponseBody> download(@Url String downloadLink);

}
